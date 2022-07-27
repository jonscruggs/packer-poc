locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "webapp" {

  ami_name      = "webapp-arm64-${ local.timestamp }"
  instance_type = "t4g.micro"
  region        = "eu-central-1"

  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-arm64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }

  ssh_username = "ubuntu"

  tags = {
      Name = "WebApp"
  }
}

# a build block invokes sources and runs provisioning steps on them.
build {
  sources             = ["source.amazon-ebs.webapp"]

  # Create a directory to upload the codebase to
  # Packer will fail if the directory doesn't exist
  provisioner "shell" {
    inline = ["mkdir -p /tmp/codebase"]
  }

  # Upload the entire codebase to the AMI
  provisioner "file" {
    source        = "./"
    destination   = "/tmp/codebase/"
  }

  # Run all the required scripts
  # Place your provisioning scripts here
  provisioner "shell" {
    scripts            = [
      "./packer/scripts/unpack-codebase.sh"
    ]
  }
}