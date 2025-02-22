terraform {
  required_providers {
    statuscake = {
      source = "StatusCakeDev/statuscake"
      version = "2.2.2"
    }
  }
}

resource "statuscake_uptime_check" "example" {
  check_interval = 300
  confirmation   = 3
  name           = "example-site"
  trigger_rate   = 10

  http_check {
    timeout          = 20
    validate_ssl     = true
    status_codes = [
      "200"
    ]
  }

  monitored_resource {
    address = "https://www.example.com"
  }
  tags = [
    "production",
  ]
}

output "example_com_uptime_check_id" {
  value = statuscake_uptime_check.example.id
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