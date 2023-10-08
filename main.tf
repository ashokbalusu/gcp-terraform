# resource "google_storage_bucket" "gcpttproject" {
#   name          = "ab-gcp-terraform-github-1"
#   location      = "US"
#   force_destroy = true

#   public_access_prevention = "enforced"
# }

resource local_file testing {
  content = "testing local file creation"
  filename             = "test.txt"
}
