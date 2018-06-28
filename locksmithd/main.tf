data "ignition_systemd_unit" "locksmithd" {
  name    = "locksmithd.service"
  enabled = true

  dropin = [
    {
      name = "30-lock.conf"

      content = <<EOF
[Service]
Environment="REBOOT_STRATEGY=${var.locksmithd_reboot_strategy}"
Environment="LOCKSMITHD_REBOOT_WINDOW_LENGTH=${var.locksmithd_window_length}"
Environment="LOCKSMITHD_REBOOT_WINDOW_START=${var.locksmithd_window_start}"
Environment="LOCKSMITHCTL_GROUP=${var.locksmithd_group}"
EOF
    },
  ]
}
