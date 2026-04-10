#!/bin/sh
set -eu

echo "[omnitools] starting add-on"
echo "[omnitools] upstream ref: ${OMNITOOLS_REF:-unknown}"
echo "[omnitools] ingress port: 8099"
echo "[omnitools] nginx root: /usr/share/nginx/html"
echo "[omnitools] enforcing ingress-only access via Home Assistant supervisor proxy"

nginx -t

exec nginx -g "daemon off;"
