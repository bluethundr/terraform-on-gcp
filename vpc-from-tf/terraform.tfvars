project      = "terraform-461115"
network_name = "jf-dev-sandbox-network"
subnets = [
  {
    subnet_name   = "sanbox1"
    subnet_region = "us-central1"
    subnet_ip     = "10.128.0.5/24"
  },
  {
    subnet_name   = "sandbox2"
    subnet_region = "us-east1"
    subnet_ip     = "10.128.0.6/24"
  },
  {
    subnet_name   = "sandbox3"
    subnet_region = "us-west1"
    subnet_ip     = "10.128.0.7/24"
  }

]



