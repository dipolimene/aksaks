variable "vnet_address" {
  description = "The CIDR address of vnet, /8 address"
  type        = string
  default     = "15.0.0.0/8"
}

variable "subnet_aks_address" {
  description = "The CIDR address of aks subnet, /16 address to minimum allowed"
  type        = string
  default     = "15.0.0.0/16"
}

variable "subnet_app_gateway_address" {
  description = "The CIDR address of the application gateway subnet, /16 address to minimum allowed"
  type        = string
  default     = "15.1.0.0/16"
}

variable "location" {
  description = "The region"
  type        = string
  default     = "uksouth"
}

variable "aks_service_cidr" {
  description = "CIDR notation IP range from which to assign service cluster IPs"
  default     = "10.0.0.0/16"
}

variable "aks_dns_service_ip" {
  description = "DNS server IP address"
  default     = "10.0.0.10"
}