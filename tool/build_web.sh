#!/usr/bin/env bash
# Release PWA build: CanvasKit served from our host (not Google's CDN) so the
# service worker can cache it, the asset list web/sw.js precaches, and the
# CSP's connect-src filled with this environment's API, socket and Sentry hosts.
set -euo pipefail

flutter build web --release --no-web-resources-cdn --dart-define-from-file=env/env.json "$@"

python3 - <<'PY'
import json
from urllib.parse import urlparse

env = json.load(open('env/env.json'))
origins = sorted({
    f'{url.scheme}://{url.netloc.split("@")[-1]}'
    for url in (urlparse(env.get(key, '')) for key in ('BASE_URL', 'WS_URL', 'SENTRY_DSN'))
    if url.scheme and url.netloc
})
path = 'build/web/staticwebapp.config.json'
config = open(path).read().replace('__API_ORIGINS__', ' '.join(origins))
open(path, 'w').write(config)
PY

cd build/web
find assets -type f ! -name NOTICES | sort \
  | python3 -c 'import json, sys; print(json.dumps([l.strip() for l in sys.stdin]))' \
  > precache.json
