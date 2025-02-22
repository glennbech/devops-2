terraform {
  required_providers {
    statuscake = {
      source = "StatusCakeDev/statuscake"
      version = "2.2.2"
    }
  }
}

provider "statuscake" {
  api_token = var.statuscake_api_key
}

module "website_monitor_1" {
  source = "./modules/website_monitor"
  website_url = "https://www.example1.com"
  contact_group_name = "example-group-1"
}

module "website_monitor_2" {
  source = "./modules/website_monitor"
  website_url = "https://www.example2.com"
  contact_group_name = "example-group-2"
}

output "website_monitor_1_uptime_check_id" {
  value = module.website_monitor_1.uptime_check_id
}

output "website_monitor_2_uptime_check_id" {
  value = module.website_monitor_2.uptime_check_id
}