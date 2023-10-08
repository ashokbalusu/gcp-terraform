# resource "google_storage_bucket" "gcpttproject" {
#   name          = "ab-gcp-terraform-github-1"
#   location      = "US"
#   force_destroy = true

#   public_access_prevention = "enforced"
# }

# resource local_file testing {
#   content = "testing local file creation"
#   filename             = "test.txt"
# }

resource random_integer rint {
  min = 10
  max = 30
}

resource random_string ran_string {
  length  = 10
}

output rint_output {
  value       = random_integer.rint.result
}

output ran_string_output{
  value = random_string.ran_string.result
}