part of 'user_login_model.dart';

UserLoginModel _$UserLoginModelFromJson(Map<String, dynamic> json) =>
    UserLoginModel(
      email: json['email'] as String?,
      password: json['password'] as String?,
      remember: json['rememberMe'] as bool?,
    );

Map<String, dynamic> _$UserLoginModelToJson(UserLoginModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'rememberMe': instance.remember,
    };
