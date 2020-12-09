data "template_file" "web_server_setup" {
  template  = "${file("${path.module}/templates/web_server_setup.sh.tpl")}"
}