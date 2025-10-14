variable "akamai_client_secret" {}
variable "akamai_host" {}
variable "akamai_access_token" {}
variable "akamai_client_token" {}
variable "akamai_account_key" {}
variable "ab_test"{
    type = string
    default = "A"
}
variable "apps" {
  default = [ "www", "api", "blog", "shop", "cdn"]
}