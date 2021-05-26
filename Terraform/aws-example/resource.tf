variable "AMI" {}
variable "INSTANCE_TYPE" {}
variable "INSTANCE_USERNAME" {}
variable "PATH_TO_PRIVATE_KEY" {}
variable "PATH_TO_PUBLIC_KEY" {}

resource "aws_key_pair" "mykey" {
	key_name = "mykey"
	public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "example" {
    ami = "${var.AMI}"
    instance_type = "${var.INSTANCE_TYPE}"
    key_name = "${aws_key_pair.mykey.key_name}"

    provisioner "file" {
		source = "script.sh"
		destination = "/tmp/script.sh"
	}

    provisioner "file" {
		source = "app.py"
		destination = "/tmp/app.py"
	}

    provisioner "remote-exec" {
		inline = [
			"chmod +x /tmp/script.sh",
			"sudo /tmp/script.sh"
		]
	}

	connection {
		host = coalesce(self.public_ip, self.private_ip)
    	type = "ssh"
		user = "${var.INSTANCE_USERNAME}"
		private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
	}
}

