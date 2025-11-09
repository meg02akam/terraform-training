resource "akamai_gtm_domain" "my-domain" {
  contract                = data.akamai_group.my_group_id.contract_id
  group                   = data.akamai_group.my_group_id.id
  name                    = "prlab.lol.akadns.net"
  type                    = "basic"
  email_notification_list = ["mehanuma@akamai.com"]
  comment                 = "Imports Exercise in Terraform"
}