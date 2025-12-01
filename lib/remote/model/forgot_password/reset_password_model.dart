import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:green_school/remote/model/forgot_password/convert_model.dart';
part 'reset_password_model.g.dart';

@JsonSerializable()
class ResetPasswordModel {
  String message;
  int statusCode;

  @DataOrBoolConverter()
  final dynamic data;

  ResetPasswordModel({required this.message, required this.statusCode, this.data});

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordModelFromJson(json);
 Map<String, dynamic> toJson() => _$ResetPasswordModelToJson(this);
}