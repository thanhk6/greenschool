part of 'redemption_model.dart';

RedemptionModel _$RedemptionModelFromJson(Map<String, dynamic> json) =>
    RedemptionModel(
      message: json['message'] ?? '',
      statusCode: json['statusCode'] ?? 0,
      data: _parseData(json['data']),
    );

Map<String, dynamic> _$RedemptionModelToJson(RedemptionModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data is RedemptionFailed ? (instance.data as RedemptionFailed).toJson() : instance.data,
    };

dynamic _parseData(dynamic data) {
  if (data is Map<String, dynamic> && data.containsKey('id')) {
    return RedemptionData.fromJson(data);
  } else if (data is Map<String, dynamic> && data.containsKey('isSuccessed')) {
    return RedemptionFailed.fromJson(data);
  }
  return null;
}

RedemptionFailed _$RedemptionFailedFromJson(Map<String, dynamic> json) =>
    RedemptionFailed(
      isSuccessed: json['isSuccessed'] ?? false,
      message: json['message'],
      resultObj: json['resultObj'] ?? false,
    );

Map<String, dynamic> _$RedemptionFailedToJson(RedemptionFailed instance) =>
    <String, dynamic>{
      'isSuccessed': instance.isSuccessed,
      'message': instance.message,
      'resultObj': instance.resultObj,
    };

RedemptionData _$RedemptionDataFromJson(Map<String, dynamic> json) =>
    RedemptionData(
      id: json['id'] ?? '',
      userAppId: json['userAppId'] ?? 0,
      userName: json['userName'] ?? '',
      rewardId: json['rewardId'] ?? 0,
      rewardName: json['rewardName'] ?? '',
      dateAdded: json['dateAdded'] ?? '',
      quantity: json['quantity'] ?? 0,
      totalPointsSpent: json['totalPointsSpent'] ?? 0,
    );

Map<String, dynamic> _$RedemptionDataToJson(RedemptionData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userAppId': instance.userAppId,
      'userName': instance.userName,
      'rewardId': instance.rewardId,
      'rewardName': instance.rewardName,
      'dateAdded': instance.dateAdded,
      'quantity': instance.quantity,
      'totalPointsSpent': instance.totalPointsSpent,
    };
