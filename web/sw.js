'use strict';

// Network first, cache as fallback: online users always get the latest
// deploy, and the last one they loaded still opens with no internet.
const CACHE = 'rapsap-app-shell';
const SHELL = ['./', 'index.html', 'manifest.json', 'favicon.png'];

self.addEventListener('install', (event) => {
  self.skipWaiting();
  event.waitUntil(precache());
});

self.addEventListener('activate', (event) => {
  event.waitUntil(
    (async () => {
      const names = await caches.keys();
      await Promise.all(names.filter((n) => n !== CACHE).map((n) => caches.delete(n)));
      await self.clients.claim();
    })()
  );
});

// The page reports the files it loaded before this worker took control.
self.addEventListener('message', (event) => {
  const urls = event.data && event.data.cacheUrls;
  if (Array.isArray(urls)) event.waitUntil(addAll(urls.filter(isSameOrigin)));
});

self.addEventListener('fetch', (event) => {
  const request = event.request;
  if (request.method !== 'GET' || !isSameOrigin(request.url)) return;
  event.respondWith(networkFirst(request));
});

async function networkFirst(request) {
  const cache = await caches.open(CACHE);
  let response;
  try {
    response = await fetch(request);
  } catch (error) {
    // Ignore query strings: version.json is fetched with a new ?cachebuster.
    const cached = await cache.match(cacheKey(request), { ignoreSearch: true });
    if (cached) return cached;
    throw error;
  }
  // Partial (206) and error responses can't be reused offline.
  if (response.status === 200) {
    cache.put(cacheKey(request), response.clone()).catch((error) => {
      console.warn('Not cached:', request.url, error);
    });
  }
  return response;
}

// All app routes are served by index.html.
function cacheKey(request) {
  return request.mode === 'navigate' ? 'index.html' : request;
}

async function precache() {
  const assets = await fetch('precache.json')
    .then((response) => (response.ok ? response.json() : []))
    .catch(() => []);
  await addAll(SHELL.concat(assets));
}

async function addAll(urls) {
  const cache = await caches.open(CACHE);
  await Promise.all(
    urls.map((url) =>
      cache.add(url).catch((error) => console.warn('Not cached:', url, error))
    )
  );
}

function isSameOrigin(url) {
  return new URL(url, self.location.href).origin === self.location.origin;
}
