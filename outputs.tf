output "my_group_id" {
    value = data.akamai_group.my_group_id.id
}

output "my_property_id"{
    value=data.akamai_property.my_property_id.property_id 
}

output "my_appsec_id"{
    value=data.akamai_appsec_configuration.mehanuma_secfile.id
}