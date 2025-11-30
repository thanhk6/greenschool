import 'package:green_school/remote/model/forgot_password/convert_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forgot_password_model.g.dart';

@JsonSerializable()
class ForgotPasswordModel {
  String message;
  int statusCode;
  @DataOrBoolConverter()
  final dynamic data;

  ForgotPasswordModel({
    required this.message,
    required this.statusCode,
    this.data,
  });

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordModelFromJson(json);
  Map<String, dynamic> toJson() => _$ForgotPasswordModelToJson(this);
}

@JsonSerializable()
class Data {
  bool isSuccess;
  String message;
  bool resultObj;

  Data({
    required this.isSuccess,
    required this.message,
    required this.resultObj,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
