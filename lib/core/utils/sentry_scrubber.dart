import 'package:sentry_flutter/sentry_flutter.dart';

/// Sentry gets errors and stack traces only. Requests, users and breadcrumb
/// details can hold tokens, phone numbers or OTPs, so they never leave the
/// device.
SentryEvent scrubSentryEvent(SentryEvent event, Hint hint) => event
  ..request = null
  ..user = null
  ..breadcrumbs = event.breadcrumbs?.map(_withoutData).toList();

Breadcrumb? scrubSentryBreadcrumb(Breadcrumb? breadcrumb, Hint hint) =>
    breadcrumb == null ? null : _withoutData(breadcrumb);

Breadcrumb _withoutData(Breadcrumb breadcrumb) => breadcrumb..data = null;
