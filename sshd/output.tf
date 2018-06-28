output "file_sshd_config_id" {
  value = "${data.ignition_file.sshd_config.id}"
}

output "file_sshd_user_ca_key_id" {
  value = "${data.ignition_file.sshd_user_ca_key.id}"
}

output "file_signhostssh_id" {
  value = "${data.ignition_file.signhostssh.id}"
}

output "systemd_signhostssh_id" {
  value = "${data.ignition_systemd_unit.signhostssh.id}"
}
