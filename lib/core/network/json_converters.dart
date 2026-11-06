import 'package:json_annotation/json_annotation.dart';

/// The API sends ids as numbers or strings; the app keeps every id a string.
class IdConverter implements JsonConverter<String, Object> {
  const new();

  @override
  String fromJson(Object json) => '$json';

  @override
  Object toJson(String id) => id;
}
