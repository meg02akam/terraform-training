terraform {
  required_providers {
    akamai = {
      source  = "akamai/akamai"
      version =  "~> 9.0"
    }
  }
  required_version = ">= 1.0"
}

provider "akamai" {
  edgerc         = var.edgerc_path
  config_section = var.config_section
}

resource "akamai_gtm_domain" "megha" {
  contract                  = var.contractid
  group                     = var.groupid
  name                      = "megha.akadns.net"
  type                      = "basic"
  comment                   = "perf test"
  email_notification_list   = ["mehanuma@akamai.com"]
  default_timeout_penalty   = 25
  load_imbalance_percentage = 10
  default_error_penalty     = 75
  cname_coalescing_enabled  = false
  load_feedback             = false
  end_user_mapping_enabled  = false
  sign_and_serve            = false
}
