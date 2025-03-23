resource "google_storage_bucket" "bucket-cloud_function" {
  name     = "${var.function_bucket}-${var.env}"
  location = "US"
}

data "archive_file" "source" {
  type        = "zip"
  source_dir  = "./src"
  output_path = "./src/function.zip"
}


resource "google_storage_bucket_object" "bucket-cloud_function-obj" {
  name                = "function.zip"
  storage_class       = "STANDARD"
  content_disposition = "attachment"
  content_encoding    = "gzip"
  content_type        = "application/zip"
  bucket              = google_storage_bucket.bucket-cloud_function.name
  source              = data.archive_file.source.output_path
  depends_on          = [data.archive_file.source]
}


resource "google_cloudfunctions_function" "hello-world" {
  name                         = "${var.function_name}-${var.env}"
  description                  = var.description
  runtime                      = var.runtime
  entry_point                  = var.entry_point
  available_memory_mb          = 128
  source_archive_bucket        = google_storage_bucket.bucket-cloud_function.name
  source_archive_object        = google_storage_bucket_object.bucket-cloud_function-obj.name
  trigger_http                 = true
  https_trigger_security_level = "SECURE_ALWAYS"
  timeout                      = 60
  labels = {
    env = var.env
  }
  depends_on = [google_storage_bucket.bucket-cloud_function, google_storage_bucket_object.bucket-cloud_function-obj]
}
