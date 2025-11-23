part of 'event_model.dart';

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
  message: json['message'] ?? '',
  statusCode: json['statusCode'] ?? 0,
  data: EventData.fromJson(json['data']),
);

Map<String, dynamic> _$EventModelToJson(EventModel instance) => <String, dynamic>{
  'message': instance.message,
  'statusCode': instance.statusCode,
  'body': instance.data.toJson(),
};

EventData _$EventDataFromJson(Map<String, dynamic> json) => EventData(
  isSuccessed: json['isSuccessed'] as bool,
  message: json['message'] ?? '',
  resultObj: EventResult.fromJson(json['resultObj']),
);

Map<String, dynamic> _$EventDataToJson(EventData instance) => <String, dynamic>{
  'isSuccessed': instance.isSuccessed,
  'message': instance.message,
  'resultObj': instance.resultObj.toJson(),
};

EventResult _$EventResultFromJson(Map<String, dynamic> json) => EventResult(
  id: json['id'] ?? 0,
  userAppId: json['userAppId'] ?? 0,
  userName: json['userName'] ?? '',
  binId: json['binId'] ?? 0,
  binCode: json['binCode'] ?? '',
  unitId: json['unitId'] ?? 0,
  unitName: json['unitName'] ?? '',
  quantity: json['quantity'] ?? 0,
  wasteTypeName: json['wasteTypeName']  ?? '',
  earnedPoints: json['earnedPoints'] ?? 0,
  dateAdded: json['dateAdded'] ?? '',
);

Map<String, dynamic> _$EventResultToJson(EventResult instance) => <String, dynamic>{
  'id': instance.userAppId,
  'userAppId': instance.userAppId,
  'userName': instance.unitName,
  'binId': instance.binId,
  'binCode': instance.binCode,
  'unitId': instance.unitId,
  'unitName': instance.unitName,
  'quantity': instance.quantity,
  'wasteTypeName': instance.wasteTypeName,
  'earnedPoints': instance.earnedPoints,
  'dateAdded': instance.dateAdded,
};
