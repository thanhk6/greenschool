part of 'register_model.dart';

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      message: json['message'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      data: _parseData(json['data']),
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data is RegisterDataFailed ? (instance.data as RegisterDataFailed).toJson() : instance.data,
    };

dynamic _parseData(dynamic data) {
  if (data is String) {
    return data;
  } else if (data is Map<String, dynamic>) {
    return RegisterDataFailed.fromJson(data);
  }
  return null;
}

RegisterDataFailed _$RegisterDataFailedFromJson(Map<String, dynamic> json) =>
    RegisterDataFailed(
      isSuccessed: json['isSuccessed'] ?? false,
      message: json['message'],
      resultObj: json['resultObj'] ?? false,
    );

Map<String, dynamic> _$RegisterDataFailedToJson(RegisterDataFailed instance) =>
    <String, dynamic>{
      'isSuccessed': instance.isSuccessed,
      'message': instance.message,
      'resultObj': instance.resultObj,
    };
