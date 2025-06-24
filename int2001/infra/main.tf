resource "service_bus" "name" {
    name                = "example-service-bus"
    location            = "East US"
    resource_group_name = "example-resource-group"
    sku                 = "Standard"
    
    tags = {
        environment = "production"
        team        = "infra"
    }
    
    lifecycle {
        ignore_changes = [
        tags["environment"]
        ]
    }
    
    depends_on = [
        azurerm_resource_group.example
    ]
}          
