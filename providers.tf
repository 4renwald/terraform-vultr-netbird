terraform {
  required_version = ">=1.12.2"

  required_providers {
    vultr = {
      source  = "vultr/vultr"
      version = "2.26.0"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

provider "vultr" {
  api_key = var.vultr_api_key
  rate_limit    = 100
  retry_limit   = 3
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}