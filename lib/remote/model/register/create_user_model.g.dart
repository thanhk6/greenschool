part of 'create_user_model.dart';

CreateUserModel _$CreateUserModelFromJson(Map<String, dynamic> json) =>
    CreateUserModel(
      fullName: json['fullName'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      email: json['email']  ?? '',
      isActive: json['isActive'] ?? false,
      dob: json['dob'] ?? '',
      password: json['password'] ?? '',
    );

Map<String, dynamic> _$CreateUserModelToJson(CreateUserModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'isActive': instance.isActive,
      'dob': instance.dob,
      'password': instance.password,
    };
