part of 'create_user_model.dart';

CreateUserModel _$CreateUserModelFromJson(Map<String, dynamic> json) =>
    CreateUserModel(
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      userName: json['username'] as String?,
      passwordHash: json['passwordHash'] as String?,
      passwordSalt: json['passwordSalt'] as String?,
      isActive: json['isActive'] as bool?,
      dob: json['dob'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$CreateUserModelToJson(CreateUserModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'username': instance.userName,
      'passwordHash': instance.passwordHash,
      'passwordSalt': instance.passwordSalt,
      'isActive': instance.isActive,
      'dob': instance.dob,
      'password': instance.password,
    };
