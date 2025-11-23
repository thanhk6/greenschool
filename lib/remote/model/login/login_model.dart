import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  String message;
  int statusCode;
  dynamic data;

  LoginModel({required this.message, required this.statusCode, required this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

class LoginDataFailed {
  bool isSuccessed;
  String message;
  bool resultObj;

  LoginDataFailed({
    required this.isSuccessed,
    required this.message,
    required this.resultObj,
  });

  factory LoginDataFailed.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFailedFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataFailedToJson(this);
}