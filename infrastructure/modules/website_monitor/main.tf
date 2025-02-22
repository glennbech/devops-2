terraform {
  required_providers {
    statuscake = {
      source = "StatusCakeDev/statuscake"
      version = "2.2.2"
    }
  }
}

variable "website_url" {
  type = string
}

variable "contact_group_name" {
  type = string
}

variable "statuscake_api_key" {
  type = string
}

provider "statuscake" {
  api_key = var.statuscake_api_key
}

resource "statuscake_contact_group" "example" {
  name = var.contact_group_name
  emails = ["example@example.com"]
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
    address = var.website_url
  }
  tags = [
    "production",
  ]
}

output "uptime_check_id" {
  value = statuscake_uptime_check.example.id
}