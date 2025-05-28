resource "google_compute_instance" "vm-fromterraform" {
       name = "vm-from-terraform"
       machine_type = "e2-medium"
       zone = "us-central1-a"

        tags = [
            "vm-from-tf",       // Assuming you still want this from earlier
            "e2-medium",        // From your first conceptual pair
            "web-server"        // From your second conceptual pair
        ]

        labels = {
            created_by = "terraform",
            function   = "web-server",
           environment = "development" 
        }

          // VMs need a boot disk
    boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11" // Example: Specify your desired image
        labels = {
        environment   = "development", // Can be consistent with instance labels
        disk_function = "boot_os",
        os_type       = "debian-11",
        managed_by    = "terraform"
       }
      }
    }

    // VMs also need at least one network interface
    network_interface {
    network = "default" // Or your specific VPC network
  }

  metadata_startup_script = "echo hi > /test.txt"
  allow_stopping_for_update = true
}
