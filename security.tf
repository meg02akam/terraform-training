//Create appsec config resource

resource "akamai_appsec_configuration" "mehanuma_secfile" {
name="mehanuma-security"
group_id = data.akamai_group.my_group_id.id
contract_id = "1-1NC95D"
description ="my-first-security-config"
host_names = ["mehanuma.prlab.lol"]
}

//Create appsec policy resource within the above appsec config
resource "akamai_appsec_security_policy" "my_policy" {
    config_id = akamai_appsec_configuration.mehanuma_secfile.config_id
    default_settings       = true
    security_policy_name   = "my-policy"
    security_policy_prefix = "meh1"
}

data "akamai_appsec_security_policy" "existing_policy" {
  config_id            = akamai_appsec_configuration.mehanuma_secfile.config_id
  security_policy_name = akamai_appsec_security_policy.my_policy.security_policy_name
}

resource "akamai_appsec_security_policy" "duplicated_policy" {
  config_id                      = akamai_appsec_configuration.mehanuma_secfile.config_id
  create_from_security_policy_id = data.akamai_appsec_security_policy.existing_policy.security_policy_id
  security_policy_name           = "duplicated-policy"
  security_policy_prefix         = "meh2"
}