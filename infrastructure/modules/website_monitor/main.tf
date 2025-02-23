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

variable "contact_group_emails" {
  type = list(string)
}

resource "statuscake_contact_group" "example" {
  name   = var.contact_group_name
  emails = var.contact_group_emails
}

resource "statuscake_uptime_check" "example" {
  check_interval = 300
  confirmation   = 3
  name           = "example-site"
  trigger_rate   = 10

  http_check {
    timeout      = 20
    validate_ssl = true
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

output "contact_group_id" {
  value = statuscake_contact_group.example.id
}