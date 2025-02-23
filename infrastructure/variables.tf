variable "statuscake_api_key" {
  type = string
}

variable "website_url" {
  type = string
  default = "https://www.example.com"
}

variable "contact_group_name" {
  type = string
  default = "example-group"
}

variable "contact_group_emails" {
  type = list(string)
  default = ["example@example.com"]
}