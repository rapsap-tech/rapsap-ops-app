import 'package:logger/logger.dart';

/// Debug builds only (DevelopmentFilter). Never log tokens, OTPs or phones.
final Logger appLogger = Logger(printer: PrettyPrinter(methodCount: 0));
