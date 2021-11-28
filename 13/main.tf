

resource "aws_ebs_volume" "envio" {
  availability_zone = "us-east-1a"
  size = 2000 // Increase from 1000 -> 2000
  type = "gp2"
  tags {
    Name      = "envio"
    Role      = "monitoring"
    Terraform = "true"
    FS        = "xfs"
  }
}

//Get the instance ID
data "aws_instance" "envio" {
  filter {
    name   = "block-device-mapping.volume-id"
    values = ["${aws_ebs_volume.envio.id}"]
  }
}

output "instance_id" {
  value = "${data.aws_instance.envio.id}"
}

locals {
  mount_point = "${data.aws_instance.envio.ebs_block_device.0.device_name}"
}

resource "null_resource" "expand_disk" {
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = "${file("~/.ssh/id_rsa")}" #use the pemkey to access instance
    host        = "${data.aws_instance.envio.public_ip}"
  }
  
  provisioner "remote-exec" {
    inline = [
      "sudo lsblk",
      "sudo xfs_growfs ${local.mount_point}",
    ]
  }
}