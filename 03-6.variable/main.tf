variable "string" {
  type        = string
  description = "var String"
  default     = "myString"
}

variable "number" {
  type    = number
  default = 123
}

variable "boolean" {
  default = true
}

variable "list" {
  default = [
    "google",
    "vmware",
    "amazon",
    "microsoft"
  ]
}

output "list_index_0" {
  value = var.list.0
}

output "list_all" {
  value = [
    for name in var.list : upper(name)
  ]
}

variable "map" { # Sorting
  default = {
    aws   = "amazon",
    azure = "microsoft",
    gcp   = "google"
  }
}

variable "set" { # Sorting
  type = set(string)
  default = [
    "google",
    "vmware",
    "amazon",
    "microsoft"
  ]
}

variable "object" {
  type = object({ name = string, age = number })
  default = {
    name = "abc"
    age  = 12
  }
}

variable "tuple" {
  type    = tuple([string, number, bool])
  default = ["abc", 123, true]
}

variable "ingress_rules" { # optional ( >= terraform 1.3.0)
  type = list(object({
    port        = number,
    description = optional(string),
    protocol    = optional(string, "tcp"),
  }))
  default = [
    { port = 80, description = "web" },
  { port = 53, protocol = "udp" }]
}

# validation
variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
  default     = "ami-21321"

  validation {
    condition     = length(var.image_id) > 4
    error_message = "The image_id value must exceed 4."
  }

  validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^ami-", var.image_id))
    error_message = "The image_id value must starting with \"ami-\"."
  }
}

# reference
variable "my_password" {
    default   = "password"
}

resource "local_file" "abc1" {
  content  = var.my_var
  filename = "${path.module}/abc.txt"
}

# sensitive
variable "sensitive_password" {
  default   = "password"
  sensitive = true
}

resource "local_file" "abc2" {
  content  = var.sensitive_password
  filename = "${path.module}/abc2.txt"
}