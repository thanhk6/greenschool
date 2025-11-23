part of 'info_model.dart';

InfoModel _$InfoModelFromJson(Map<String, dynamic> json) => InfoModel(
  message: json['message'] ?? '',
  statusCode: json['statusCode'] ?? 0,
  data: InfoData.fromJson(json['data']),
);

Map<String, dynamic> _$InfoModelToJson(InfoModel instance) => <String, dynamic>{
  'message': instance.message,
  'statusCode': instance.statusCode,
  'data': instance.data.toJson(),
};

InfoData _$InfoDataFromJson(Map<String, dynamic> json) => InfoData (
      isSuccessed: json['isSuccessed'] ?? false,
      message: json['message'] ?? '',
      resultObj: InfoResult.fromJson(json['resultObj']),
      );

Map<String, dynamic> _$InfoDataToJson(InfoData instance) => <String, dynamic>{
  'isSuccessed' : instance.isSuccessed,
  'message' : instance.message,
  'resultObj' : instance.resultObj.toJson(),
  
};

InfoResult _$InfoResultFromJson(Map<String, dynamic> json) => InfoResult(
      id: json['id'] ?? 0,
      userAppId: json['userAppId'] ?? 0,
      totalPoints: json['totalPoints'].toString(),
      pointsToAdd: json['pointsToAdd'].toString(),
      fullName: json['fullName'] ?? '',
      updateAt: DateTime.tryParse(json['updateAt'] ?? '') ?? DateTime.now(),
    );

Map<String, dynamic> _$InfoResultoJson(InfoResult instance) => <String, dynamic>{
  'id' : instance.id,
  'userAppId' : instance.userAppId,
  'totalPoints' : instance.totalPoints,
  'pointsToAdd' : instance.pointsToAdd,
  'fullName' : instance.fullName,
  'updateAt' : instance.updateAt,
};
