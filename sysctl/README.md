## sysctl

### Usage

This module sysctl tuning values and drops them in `/etc/sysctl.d/`.  Because 
direct references to map/list variables cannot be passed to a template, it uses 
"pre-baked" templates.  If you wish to use something aside from the default 
template, set the `sysctl_template` variable to the file name of the template in 
the `resources` folder while calling the module.

Usage Example:

```
module "sysctl" {
  source = "git@github.com:lmickh/terraform-ignition-modules.git//sysctl"

  sysctl_template = "sysctl-default.conf"
}

data "ignition_config" "example" {
  files = [
    "${module.ign_ssh.file_sysctl_id}",
  ]

}
```


