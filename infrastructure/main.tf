# Here we go
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
  website_url = "https://www.vg.no"
  contact_group_name = "vg-group"
  contact_group_emails = ["vg@example.com"]
}

module "website_monitor_2" {
  source = "./modules/website_monitor"
  website_url = "https://xkcd.com"
  contact_group_name = "xkcd-group"
  contact_group_emails = ["xkcd@example.com"]
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