## ulimits

### Usage

This module provides ulimit drop-in file places it in `/etc/security/limits.d/`. 
Because direct references to map/list variables cannot be passed to a template, 
it uses "pre-baked" templates.  If you wish to use something aside from the 
default template, set the `ulimits_template` variable to the file name of the 
template in the `resources` folder while calling the module.

Usage Example:

```
module "ulimits" {
  source = "git@github.com:lmickh/terraform-ignition-modules.git//ulimits"

  sysctl_template = "ulimits-default.conf"
}

data "ignition_config" "example" {
  files = [
    "${module.ign_ssh.file_ulimits_id}",
  ]

}
```


