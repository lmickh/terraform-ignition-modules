output "file_dockeropts_id" {
  value = "${data.ignition_file.dockeropts.id}"
}

output "file_docker_ulimit_id" {
  value = "${data.ignition_file.docker_ulimit.id}"
}

output "file_docker_1_12" {
  value = "${data.ignition_file.docker-1-12.id}"
}
