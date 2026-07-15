#!/usr/bin/env bash
# Sipling'e ÖZEL debug Chrome'u başlatır.
#
# 🚨 Port 9334 RANDEVIO'ya aittir, dokunma. Sipling = 9360.
# Zaten açıksa hiçbir şey yapmaz.

PORT=9360
PROFIL="C:\\Users\\asim_\\sipling-profile"
CHROME="C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"

if curl -s -m 2 "http://localhost:$PORT/json/version" >/dev/null 2>&1; then
  echo "Sipling tarayıcısı zaten açık (port $PORT)."
  exit 0
fi

cmd //c start "" "$CHROME" \
  --remote-debugging-port=$PORT \
  --user-data-dir="$PROFIL" \
  --no-first-run \
  --no-default-browser-check \
  about:blank

for i in $(seq 1 15); do
  sleep 1
  if curl -s -m 2 "http://localhost:$PORT/json/version" >/dev/null 2>&1; then
    echo "Sipling tarayıcısı açıldı (port $PORT, profil sipling-profile)."
    exit 0
  fi
done

echo "Tarayıcı $PORT portunda açılamadı." >&2
exit 1
