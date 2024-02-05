variable "gcp_project_id" {
    type = string
    # default = "-dev-intake"
}

variable "gcp_region" {
    type = string
    description = "Provide GCP HDE Region"
}

variable "labels" {
  type = map(any)
  description = "this is a sample lables variable"
  
  default={ 
    cost_id = "14203-1234567890", 
    department_id = "00788-1234567890", 
    project_id = "it-p0000000", 
    app_code = "hdeedp", 
    tco_id = "itgedp", 
    env = "dev", 
    classification = "internal-only", 
    app_environment = "dev"
  }
}
