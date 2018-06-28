### Usage

This module configures Docker opts via systemd dropin and sets the Docker version. 
Include only the pieces you want.

Usage:

```
module "docker" {
  source = "git@github.com:lmickh/terraform-ignition-modules.git//docker"
  
  docker_opts = "--log-opt max-size=500m --log-opt max-file=3"
}

data "ignition_config" "example" {
  files = [
    "${module.ign_ssh.file_dockeropts_id}",
    "${module.ign_ssh.file_docker_1_12_id}",
  ]
}
```


