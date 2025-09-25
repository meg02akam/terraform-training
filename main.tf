data "akamai_group" "my_group_id" {
    group_name  = "SA Test PD 1"
    contract_id = "ctr_1-1NC95D"
   
}
output "my_group_id" {
    value = data.akamai_group.my_group_id.id
}
data "akamai_property" "my_property_id"{
    name="mehanuma.prlab.test"
}

output "my_property_id"{
    value=data.akamai_property.my_property_id.property_id 
}
data "akamai_appsec_configuration" "my_secfile"{
    name="aaa"
}
output "my_secfile"{
    value=data.akamai_appsec_configuration.my_secfile.host_names
}