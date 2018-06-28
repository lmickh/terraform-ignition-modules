data "template_file" "signhostssh" {
  template = "${file("${path.module}/resources/signhostssh.sh")}"

  vars {
    role-id        = "${var.tf_role-id}"
    secret-id      = "${var.tf_secret-id}"
    vault_addr     = "${var.vault_addr}"
    vault_ssh_path = "${var.vault_ssh_path}"
  }
}

data "ignition_file" "sshd_config" {
  filesystem = "root"
  path       = "/etc/ssh/sshd_config"
  mode       = "420"

  content {
    content = <<EOF
TrustedUserCAKeys /etc/ssh/trusted-user-ca-keys.pem
HostCertificate /etc/ssh/ssh_host_rsa_key-cert.pub
UsePrivilegeSeparation sandbox
Subsystem sftp internal-sftp
ClientAliveInterval 180
UseDNS no
UsePAM yes
PrintLastLog no # handled by PAM
PrintMotd no # handled by PAM
EOF
  }
}

data "ignition_file" "sshd_user_ca_key" {
  filesystem = "root"
  path       = "/etc/ssh/trusted-user-ca-keys.pem"
  mode       = "420"

  source {
    source = "https://${var.vault_addr}/v1/${var.vault_ssh_path}/public_key"
  }
}

data "ignition_file" "signhostssh" {
  filesystem = "root"
  path       = "/opt/bin/signhostssh.sh"
  mode       = "504"

  content {
    content = "${data.template_file.signhostssh.rendered}"
  }
}

data "ignition_systemd_unit" "signhostssh" {
  name    = "signhostssh.service"
  enabled = true

  content = <<EOF
[Unit]
Description=Sign host public key with Vault
ConditionFileExists=!/etc/ssh/ssh_host_rsa_key-cert.pub
Before=etcd-member.service
Requires=coreos-metadata.service
After=coreos-metadata.service
[Service]
Type=oneshot
EnvironmentFile=/run/metadata/coreos
ExecStart=/opt/bin/signhostssh.sh
[Install]
WantedBy=multi-user.target
EOF
}
