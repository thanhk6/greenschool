import 'forgot_password_model.dart';
import 'package:json_annotation/json_annotation.dart';

class DataOrBoolConverter implements JsonConverter<dynamic, dynamic> {
  const DataOrBoolConverter();

  @override
  dynamic fromJson(dynamic json) {
    if (json is bool) {
      return json;
    } else if (json is Map<String, dynamic>) {
      return Data.fromJson(json);
    }
    return null;
  }

  @override
  dynamic toJson(dynamic object) {
    if (object is bool) return object;
    if (object is Data) return object.toJson();
    return null;
  }
}