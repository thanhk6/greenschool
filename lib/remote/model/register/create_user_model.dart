import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user_model.g.dart';

@JsonSerializable()
class CreateUserModel {
  String fullName;
  String phoneNumber;
  String email;
  bool isActive;
  String dob;
  String password;

  CreateUserModel({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.isActive,
    required this.dob,
    required this.password,
  });

  factory CreateUserModel.fromJson(Map<String, dynamic> json) =>
      _$CreateUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserModelToJson(this);
}
