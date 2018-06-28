data "template_file" "dockeropts" {
  template = "${file("${path.module}/resources/10-dockeropts.conf")}"

  vars {
    docker_opts = "${var.docker_opts}"
  }
}

data "ignition_file" "dockeropts" {
  filesystem = "root"
  path       = "/etc/systemd/system/docker.service.d/10-dockeropts.conf"
  mode       = 0644

  content {
    content = "${data.template_file.dockeropts.rendered}"
  }
}

data "template_file" "docker_ulimit" {
  template = "${file("${path.module}/resources/11-docker-ulimit.conf")}"

  vars {
    docker_opts = "${var.docker_opts}"
  }
}

data "ignition_file" "docker_ulimit" {
  filesystem = "root"
  path       = "/etc/systemd/system/docker.service.d/11-docker-ulimit.conf"
  mode       = 0644

  content {
    content = "${data.template_file.docker_ulimit.rendered}"
  }
}

data "ignition_file" "docker-1-12" {
  filesystem = "root"
  path       = "/etc/coreos/docker-1.12"

  content {
    content = "yes"
  }
}
