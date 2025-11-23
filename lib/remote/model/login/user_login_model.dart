import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_login_model.g.dart';

@JsonSerializable()
class UserLoginModel {
  String? email;
  String? password;
  bool? remember;

  UserLoginModel({this.email, this.password, this.remember});

  factory UserLoginModel.fromJson(Map<String, dynamic> json) =>
      _$UserLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginModelToJson(this);
}
