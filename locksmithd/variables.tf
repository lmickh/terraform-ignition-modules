variable "locksmithd_group" {
  default     = "coreos"
  description = "The name which the group will use in etcd for a lock"
  type        = "string"
}

variable "locksmithd_reboot_strategy" {
  default     = "off"
  description = "Can be `off`, `reboot`, or `etcd-lock`"
  type        = "string"
}

variable "locksmithd_window_length" {
  default = "1h"
  type    = "string"
}

variable "locksmithd_window_start" {
  default = "Tue 06:00"
  type    = "string"
}
