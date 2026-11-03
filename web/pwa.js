'use strict';

// Captured before Flutter loads; read by install_service_web.dart.
window.addEventListener('beforeinstallprompt', function (event) {
  event.preventDefault();
  window.rapsapInstallPrompt = event;
  window.dispatchEvent(new Event('rapsapinstallchange'));
});
window.addEventListener('appinstalled', function () {
  window.rapsapInstallPrompt = null;
  window.rapsapInstalled = true;
  window.dispatchEvent(new Event('rapsapinstallchange'));
});

// Caches the app so it opens with no internet (sw.js).
if ('serviceWorker' in navigator) {
  window.addEventListener('load', function () {
    navigator.serviceWorker.register('sw.js').catch(function (error) {
      console.warn('Service worker failed:', error);
    });
    navigator.serviceWorker.ready.then(function (registration) {
      var urls = performance.getEntriesByType('resource').map(function (entry) {
        return entry.name;
      });
      registration.active.postMessage({ cacheUrls: urls });
    });
  });
}
