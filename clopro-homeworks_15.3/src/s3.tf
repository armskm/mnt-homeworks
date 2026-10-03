// https://yandex.cloud/ru/docs/storage/operations/buckets/create

// Создание сервисного аккаунта
resource "yandex_iam_service_account" "sa" {
  folder_id = var.folder_id
  name      = var.s3_user
}

// Назначение роли сервисному аккаунту
resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

// Создание статического ключа доступа
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "static access key for object storage"
}

// Создание бакета с использованием ключа
resource "yandex_storage_bucket" "backet" {
  access_key            = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key            = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket                = var.s3_name
  max_size              = var.s3_size
  default_storage_class = var.s3_class
  depends_on = [yandex_kms_symmetric_key.key-a]
  anonymous_access_flags {
    read        = true
    list        = true
    config_read = true
  }
  # включаю шифрование для бакета
  # https://yandex.cloud/ru/docs/storage/operations/buckets/encrypt
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.key-a.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

// Назначение роли сервисному аккаунту для работы с KMS-ключом
resource "yandex_kms_symmetric_key_iam_member" "sa-kms-encrypter" {
  symmetric_key_id = yandex_kms_symmetric_key.key-a.id
  role             = "kms.keys.encrypterDecrypter"
  member           = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

// Создание объекта в бакете с явной зависимостью от назначения прав на KMS
resource "yandex_storage_object" "image" {
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  bucket     = var.s3_name
  key        = "image.jpg"
  source     = "${path.module}/image.jpg"
  acl        = "public-read"

  depends_on = [
    yandex_storage_bucket.backet,
    yandex_kms_symmetric_key_iam_member.sa-kms-encrypter
  ]
}