import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user_model.g.dart';

@JsonSerializable()
class CreateUserModel {
  String? fullName;
  String? phoneNumber;
  String? userName;
  String? passwordHash;
  String? passwordSalt;
  bool? isActive;
  String? dob;
  String? password;

  CreateUserModel({
    this.fullName,
    this.phoneNumber,
    this.userName,
    this.passwordHash,
    this.passwordSalt,
    this.isActive,
    this.dob,
    this.password,
  });

  factory CreateUserModel.fromJson(Map<String, dynamic> json) =>
      _$CreateUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserModelToJson(this);
}
