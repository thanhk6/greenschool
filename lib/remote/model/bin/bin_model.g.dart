part of 'bin_model.dart';

BinModel _$BinModelFromJson(Map<String, dynamic> json) => BinModel(
  message: json['message'] ?? '',
  statusCode: json['statusCode'] ?? 0,
  data: BinData.fromJson(json['data']),
);

Map<String, dynamic> _$BinModelToJson(BinModel instance) => <String, dynamic>{
  'message': instance.message,
  'statusCode': instance.statusCode,
  'body': instance.data.toJson(),
};

BinData _$BinDataFromJson(Map<String, dynamic> json) => BinData(
  isSuccessed: json['isSuccessed'] as bool,
  message: json['message'] ?? '',
  resultObj: BinResult.fromJson(json['resultObj']),
);

Map<String, dynamic> _$BinDataToJson(BinData instance) => <String, dynamic>{
  'isSuccessed': instance.isSuccessed,
  'message': instance.message,
  'resultObj': instance.resultObj.toJson(),
};

BinResult _$BinResultFromJson(Map<String, dynamic> json) => BinResult(
  userAppId: json['userAppId'] ?? 0,
  username: json['userName'] ?? '',
  binId: json['binId'] ?? 0,
  qrCode: json['qrCode'] ?? '',
  wasteTypeId: json['wasteTypeId'] ?? 0,
  wasteTypeName: json['wasteTypeName'] ?? '',
  locationId: json['locationId'] ?? 0,
  locationName: json['locationName'] ?? '',
  address: json['address'] ?? '',
  unitId: json["unitId"] ?? 0,
  unitName: json['unitName'] ?? '',
);

Map<String, dynamic> _$BinResultToJson(BinResult instance) => <String, dynamic>{
  'userAppId': instance.userAppId,
  'userName': instance.username,
  'binId': instance.binId,
  'qrCode': instance.qrCode,
  'wasteTypeId': instance.wasteTypeId,
  'wasteTypeName': instance.wasteTypeName,
  'locationId': instance.locationId,
  'locationName': instance.locationName,
  'address': instance.address,
  'unitId' : instance.unitId,
  'unitName': instance.unitName,
};
