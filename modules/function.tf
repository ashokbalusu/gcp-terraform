data "archive_file" "source" {
    type        = "zip"
    source_dir  = "../source_cf"
    output_path = "./tmp/function.zip"
}

resource "google_storage_bucket_object" "zip" {
    source       = data.archive_file.source.output_path
    content_type = "application/zip"

    name         = "source_cf-${data.archive_file.source.output_md5}.zip"
    bucket       = google_storage_bucket.function_bucket.name

    depends_on   = [
        google_storage_bucket.function_bucket,
        data.archive_file.source
    ]
}

resource "google_storage_bucket" "function_bucket" {
    name     = "Terminology-${var.gcp_project_id}-function"
    location = var.gcp_region
}

resource "google_storage_bucket" "input_bucket" {
    name     = "${var.gcp_project_id}-in"
    location = var.gcp_region
}

resource "google_cloudfunctions_function" "function" {
    name                  = "function-terminology-on-gcs"
    runtime               = "python39"

    source_archive_bucket = google_storage_bucket.function_bucket.name
    source_archive_object = google_storage_bucket_object.zip.name

    entry_point           = "hello_gcs"
    
    event_trigger {
        event_type = "google.storage.object.finalize"
        resource   = "${var.gcp_project_id}-in"
    }

    depends_on = [
        google_storage_bucket.function_bucket,
        google_storage_bucket_object.zip
    ]
}

# module "cloud-functions_example_cloud_function2_gcs_source" {
#   source  = "app.terraform.io/hca-healthcare/cloud-functions/gcp//examples/cloud_function2_gcs_source"
#   version = "3.0.7"
#   # insert required variables here
#   gcp_project_id="hcahde040-dev-data"
#   gcp_region="us-east4"
# }

