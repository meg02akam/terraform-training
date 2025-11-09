resource "akamai_gtm_property" "test1" {
  domain                      = akamai_gtm_domain.megha.name
  name                        = "test1"
  type                        = "weighted-round-robin"
  ipv6                        = false
  score_aggregation_type      = "worst"
  stickiness_bonus_percentage = 0
  stickiness_bonus_constant   = 0
  use_computed_targets        = false
  balance_by_download_score   = false
  dynamic_ttl                 = 60
  handout_limit               = 0
  handout_mode                = "normal"
  failover_delay              = 0
  failback_delay              = 0
  ghost_demand_reporting      = false
  traffic_target {
    datacenter_id = akamai_gtm_datacenter.MI.datacenter_id
    enabled       = true
    weight        = 100
    servers       = []
    handout_cname = "mehanuma.prlab.lol"
  }
  depends_on = [
    akamai_gtm_datacenter.MI,
    akamai_gtm_domain.megha
  ]
}

resource "akamai_gtm_property" "test2" {
  domain                      = akamai_gtm_domain.megha.name
  name                        = "test2"
  type                        = "performance"
  ipv6                        = false
  score_aggregation_type      = "worst"
  stickiness_bonus_percentage = 0
  stickiness_bonus_constant   = 0
  use_computed_targets        = false
  balance_by_download_score   = false
  dynamic_ttl                 = 60
  handout_limit               = 0
  handout_mode                = "normal"
  failover_delay              = 0
  failback_delay              = 0
  ghost_demand_reporting      = false
  traffic_target {
    datacenter_id = akamai_gtm_datacenter.MI.datacenter_id
    enabled       = true
    weight        = 1
    servers       = []
    handout_cname = "mehanuma.prlab.lol"
  }
  depends_on = [
    akamai_gtm_datacenter.MI,
    akamai_gtm_domain.megha
  ]
}

