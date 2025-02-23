terraform {
  required_providers {
    statuscake = {
      source = "StatusCakeDev/statuscake"
      version = "2.2.2"
    }
  }
}

provider "statuscake" {
  api_key = var.statuscake_api_key
}

module "website_monitor_1" {
  source = "./modules/website_monitor"
  website_url = "https://www.example1.com"
  contact_group_name = "example-group-1"
  contact_group_emails = ["example1@example.com"]
}

module "website_monitor_2" {
  source = "./modules/website_monitor"
  website_url = "https://www.example2.com"
  contact_group_name = "example-group-2"
  contact_group_emails = ["example2@example.com"]
}

output "website_monitor_1_uptime_check_id" {
  value = module.website_monitor_1.uptime_check_id
}

output "website_monitor_2_uptime_check_id" {
  value = module.website_monitor_2.uptime_check_id
}

output "website_monitor_1_contact_group_id" {
  value = module.website_monitor_1.contact_group_id
}

output "website_monitor_2_contact_group_id" {
  value = module.website_monitor_2.contact_group_id
}