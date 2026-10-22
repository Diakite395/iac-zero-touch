#!/bin/bash
set -euxo pipefail
exec > >(tee /var/log/zero-touch-bootstrap.log) 2>&1

export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get install -y ansible git

# Premier passage : configuration complète
ansible-pull -U ${repo_url} -C ${repo_branch} -d /opt/zero-touch \
  -i localhost, -e server_label=${server_label} ansible/pull.yml

# Passages suivants : toutes les 15 min, uniquement si le dépôt a changé
cat > /etc/cron.d/ansible-pull <<'CRON'
*/15 * * * * root /usr/bin/ansible-pull -o -U ${repo_url} -C ${repo_branch} -d /opt/zero-touch -i localhost, -e server_label=${server_label} ansible/pull.yml >> /var/log/ansible-pull.log 2>&1
CRON
chmod 0644 /etc/cron.d/ansible-pull