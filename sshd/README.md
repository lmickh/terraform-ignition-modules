### Usage

This module configures sshd and sets up signing the host key with Vault if 
desired.  Include only the `file_sshd_config_id` if you don't want to use Vault 
signing.  Otherwise you will want to declare the variables passed to the module.

Usage:

```
module "sshd" {
  source = "git@github.com:lmickh/terraform-ignition-modules.git//sshd"
  
  tf_role-id     = "${var.tf_role-id}"
  tf_secret-id   = "${var.tf_secret-id}"
  vault_addr     = "vault.example.com"
  vault_ssh_path = "my/ssh/path"
}

data "ignition_config" "example" {
  files = [
    "${module.ign_ssh.file_sshd_config_id}",
    "${module.ign_ssh.file_sshd_user_ca_key_id}",
    "${module.ign_ssh.file_signhostssh_id}",
  ]

  systemd = [
    "${module.ign_ssh.systemd_signhostssh_id}",
  ]
}
```


