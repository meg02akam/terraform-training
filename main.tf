data "akamai_group" "my_group_id" {
    group_name  = "SA Test PD 1"
    contract_id = "1-1NC95D"
   
}


data "akamai_property" "my_property_id"{
    name="mehanuma.prlab.test"
}

data "akamai_appsec_configuration" "mehanuma_secfile" {
    name="mehanuma-security"
}

locals {
ticket_id = "TF-3001"
group_id = data.akamai_group.my_group_id.id
notes = "${local.ticket_id}-${local.group_id}"
}

locals {
  app_hostnames = {for app in var.apps : "${app}" => "${app}.example.com"}
}
output "hostname" {
  value = local.app_hostnames
}