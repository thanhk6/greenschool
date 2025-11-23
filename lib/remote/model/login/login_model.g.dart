part of 'login_model.dart';

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) =>
    LoginModel(
      message: json['message'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      data: _parseData(json['data']),
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data is LoginDataFailed ? (instance.data as LoginDataFailed).toJson() : instance.data,
    };

dynamic _parseData(dynamic data) {
  if (data is String) {
    return data;
  } else if (data is Map<String, dynamic>) {
    return LoginDataFailed.fromJson(data);
  }
  return null;
}

LoginDataFailed _$LoginDataFailedFromJson(Map<String, dynamic> json) =>
    LoginDataFailed(
      isSuccessed: json['isSuccessed'] ?? false,
      message: json['message'],
      resultObj: json['resultObj'] ?? false,
    );

Map<String, dynamic> _$LoginDataFailedToJson(LoginDataFailed instance) =>
    <String, dynamic>{
      'isSuccessed': instance.isSuccessed,
      'message': instance.message,
      'resultObj': instance.resultObj,
    };

