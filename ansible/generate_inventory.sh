#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/../terraform"
IPS=$(terraform output -json web_public_ips | python3 -c "import sys,json; print('\n'.join(json.load(sys.stdin)))")

OUT="../ansible/inventory/hosts.ini"
echo "[web]" > "$OUT"
i=1
for ip in $IPS; do
  echo "web-$i ansible_host=$ip" >> "$OUT"
  i=$((i+1))
done
echo "Inventaire généré :"
cat "$OUT"