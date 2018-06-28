data "template_file" "sysctl" {
  template = "${file("${path.module}/resources/${var.sysctl_template}")}"
}

data "ignition_file" "sysctl" {
  filesystem = "root"
  path       = "/etc/sysctl.d/00-ignition-sysctl.conf"
  mode       = "420"

  content {
    content = "${data.template_file.sysctl.rendered}"
  }
}
