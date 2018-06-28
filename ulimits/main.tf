data "template_file" "ulimits" {
  template = "${file("${path.module}/resources/${var.ulimits_template}")}"
}

data "ignition_file" "ulimits" {
  filesystem = "root"
  path       = "/etc/security/limits.d/00-ignition-ulimits.conf"
  mode       = "420"

  content {
    content = "${data.template_file.ulimits.rendered}"
  }
}
