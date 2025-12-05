part of 'delete_model.dart';

DeleteModel _$DeleteModelFromJson(Map<String, dynamic> json) =>
    DeleteModel(
      message: json['message'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      data: const DataOrBoolConverter().fromJson(json['data']),
    );

Map<String, dynamic> _$DeleteModelToJson(
  DeleteModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'statusCode': instance.statusCode,
  'data': const DataOrBoolConverter().toJson(instance.data),
};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  isSuccess: json['isSuccess'] ?? false,
  message: json['message'] ?? '',
  resultObj: json['resultObj'] ?? false,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'isSuccess': instance.isSuccess,
  'message': instance.message,
  'resultObj': instance.resultObj,
};
