#!/usr/bin/env bash

set -euo pipefail
export $(cat /run/metadata/coreos | xargs)

resp=$(curl --fail -s -X POST "https://${vault_addr}/v1/auth/approle/login" -d '{"role_id": "${role-id}", "secret_id": "${secret-id}"}')
VAULT_TOKEN=$(echo $resp | jq -r .auth.client_token)
resp=$(curl --fail -s -X POST https://${vault_addr}/v1/${vault_ssh_path}/sign/host -H "X-VAULT-TOKEN: $VAULT_TOKEN" -d "{\"cert_type\": \"host\", \"public_key\": \"$(cat /etc/ssh/ssh_host_rsa_key.pub)\"}")
echo $resp | jq -r .data.signed_key > /etc/ssh/ssh_host_rsa_key-cert.pub
chmod 640 /etc/ssh/ssh_host_rsa_key-cert.pub