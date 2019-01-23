provider "aws"{
access_key="${var.aws_access_key}"
secret_key ="${var.aws_secret_key}"
region ="us-east-1"

}
resource "aws_instance" "nginx" {
  ami           = "ami-c58c1dd3"
  instance_type = "t2.micro"
// key_name        = "${var.key_name}"

 }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install nginx -y",
      "sudo service nginx start"
    ]
  }

output "aws_instance_public_dns" {
    value = "${aws_instance.nginx.public_dns}"
}

