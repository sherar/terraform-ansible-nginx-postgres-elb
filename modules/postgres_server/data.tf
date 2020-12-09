data "template_file" "web_server_setup" {
  template           = "${file("${path.module}/templates/postgres_setup.sh.tpl")}"
}

data "aws_ami" "base_ami" {
  most_recent = true
  filter {
    name      = "name"
    values    = ["ubuntu/images/hvm-ssd/ubuntu-groovy-20.10-amd64-server-*"]
  }
  filter {
    name      = "image-id"
    values    = [ "ami-09862fe9712e8e9e9" ]
  }
  filter {
    name      = "virtualization-type"
    values    = ["hvm"]
  }
  owners      = ["099720109477"]
}