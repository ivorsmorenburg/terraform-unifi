terraform {
  experiments = [module_variable_optional_attrs]
  required_providers {
    # https://registry.terraform.io/providers/paultyng/unifi/latest/docs
    unifi = {
      source  = "paultyng/unifi"
      version = ">=0.34.0"
    }
  }
}

provider "unifi" {
  username = var.unifi_credentials.username # optionally use UNIFI_USERNAME env var
  password = var.unifi_credentials.password # optionally use UNIFI_PASSWORD env var
  api_url  = var.unifi_credentials.host     # optionally use UNIFI_API env var

  # you may need to allow insecure TLS communications unless you have configured
  # certificates for your controller
  allow_insecure = var.unifi_credentials.insecure # optionally use UNIFI_INSECURE env var

  # if you are not configuring the default site, you can change the site
  # site = "foo" or optionally use UNIFI_SITE env var
}
