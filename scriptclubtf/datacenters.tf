resource "akamai_gtm_datacenter" "MI" {
  domain                            = akamai_gtm_domain.megha.name
  nickname                          = "MI"
  city                              = "Detroit"
  state_or_province                 = "MI"
  country                           = "US"
  latitude                          = 42.33294
  longitude                         = -83.04784
  cloud_server_host_header_override = false
  cloud_server_targeting            = false
  depends_on = [
    akamai_gtm_domain.megha
  ]
}

