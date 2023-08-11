resource_group_name = "ntier-dev"
location            = "eastus"
network_range       = "10.10.0.0/16"
subnet_ranges       = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24"]
subnet_names        = ["app", "web", "db"]