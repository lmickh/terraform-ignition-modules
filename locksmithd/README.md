### Usage

This module configures a locksmithd systemd unit.  It returns the ignition id to 
be used in an `ignition_config` resource. 

Usage:

```
module "locksmithd" {
  source = "git@github.com:lmickh/terraform-ignition-modules.git//locksmithd"
  
  locksmithd_group = "example"
  locksmithd_reboot_strategy = "etcd-lock"
}

data "ignition_config" "example" {
  systemd = [
    "${module.locksmithd.systemd_locksmithd_id}
  ]
}
```


