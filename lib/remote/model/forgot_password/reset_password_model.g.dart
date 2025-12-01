part of 'reset_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordModel _$ResetPasswordModelFromJson(Map<String, dynamic> json) =>
    ResetPasswordModel(
      message: json['message'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      data: const DataOrBoolConverter().fromJson(json['data']),
    );

Map<String, dynamic> _$ResetPasswordModelToJson(ResetPasswordModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': const DataOrBoolConverter().toJson(instance.data),
    };
