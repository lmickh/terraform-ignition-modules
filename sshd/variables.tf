variable "tf_role-id" {
  default     = false
  description = "Vault approle role-id used by script Terraform provides to fetch secrets. Should be set via ENVAR"
  type        = "string"
}

variable "tf_secret-id" {
  default     = false
  description = "Vault approle secret-id used by script Terraform provides to fetch secrets. Should be set via ENVAR"
  type        = "string"
}

variable "vault_addr" {
  default     = false
  description = "Address of the Vault service to pull secrets from."
  type        = "string"
}

variable "vault_ssh_path" {
  default     = false
  description = "Path for the Vault ssh signer to manage sshd access"
  type        = "string"
}
