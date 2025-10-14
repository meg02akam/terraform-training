resource "akamai_cp_code" "my_cp_code" {
  name        = "mehanuma-tfcpcode"
  contract_id = "1-1NC95D"
  group_id    = data.akamai_group.my_group_id.id
  product_id  = "prd_Fresca"
  timeouts {
    update = "1h"
  }
}

resource "akamai_edge_hostname" "my_ehn" {
  edge_hostname = "mehanumatf.prlab.lol.edgesuite.net"
  product_id  = "prd_Fresca"
  contract_id = "1-1NC95D"
  group_id    = data.akamai_group.my_group_id.id
  ip_behavior = "IPV4"
}

data "akamai_property_rules_builder" "my_default_rule" {
  rules_v2025_07_07 {
    name      = "default"
    is_secure = false
    behavior {
      origin {
        origin_type                   = "CUSTOMER"
        hostname                      = var.ab_test == "A" ? "origin-a.example.com" : "origin-b.example.com"
        forward_host_header           = "ORIGIN_HOSTNAME"
        cache_key_hostname            = "REQUEST_HOST_HEADER"
        compress                      = true
        enable_true_client_ip         = false
        http_port                     = 80
      }
    }
    behavior {
      cp_code {
        value {
          id   = akamai_cp_code.my_cp_code.id
          name = "mehanuma-tfcpcode"
        }
      }
    }
  }
}

output "debug_app_hostnames" {
  value = local.app_hostnames
}

resource "akamai_property" "my_property" {
  name          = "mehanuma2-terraform"
  product_id    =  "prd_Fresca"
  contract_id   = "1-1NC95D"
  group_id      = data.akamai_group.my_group_id.id
  rule_format   = "v2025-07-07"
  rules= data.akamai_property_rules_builder.my_default_rule.json
  dynamic "hostnames" {
    for_each = local.app_hostnames
    content { 
    cname_from             = hostnames.value
    cname_to               = akamai_edge_hostname.my_ehn.edge_hostname
    cert_provisioning_type = "DEFAULT"
  }
  }
}
