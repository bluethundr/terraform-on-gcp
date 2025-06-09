project      = "terraform-461115"
network_name = "jf-dev-sandbox-network"
subnets = [
  {
    subnet_name   = "sanbox1"
    subnet_region = "us-central1"
    subnet_ip     = "10.128.0.0/24"
  },
  {
    subnet_name   = "sandbox2"
    subnet_region = "us-east1"
    subnet_ip     = "10.128.1.0/24"
  },
  {
    subnet_name   = "sandbox3"
    subnet_region = "us-west1"
    subnet_ip     = "10.128.2.0/24"
  }

]



