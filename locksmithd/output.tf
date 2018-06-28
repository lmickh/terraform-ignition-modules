output "systemd_locksmithd_id" {
  value = "${data.ignition_systemd_unit.locksmithd.id}"
}
