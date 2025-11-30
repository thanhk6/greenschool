part of 'r_history.dart';

RedemptionHistoryModel _$RedemptionHistoryModelFromJson(Map<String, dynamic> json) => RedemptionHistoryModel(
  isSuccessed: json['isSuccessed'] ?? false,
  message: json['message'] ?? '',
  data: RedemptionHistoryResult.fromJson(json['data']),
);

Map<String, dynamic> _$RedemptionHistoryModelToJson(RedemptionHistoryModel instance) => <String, dynamic>{
  'isSuccessed': instance.isSuccessed,
  'message': instance.message,
  'data': instance.data.toJson(),
};

RedemptionHistoryResult _$RedemptionHistoryResultFromJson(Map<String, dynamic> json) =>
    RedemptionHistoryResult(
      items: (json['items'] as List<dynamic>?)
          ?.map((item) => RedemptionHistoryItem.fromJson(item as Map<String, dynamic>))
          .toList()?? [],
      pageIndex: json['pageIndex'] ?? 0,
      pageSize: json['pageSize'] ?? 0,
      totalRecords: json['totalRecords'] ?? 0,
      pageCount: json['pageCount'] ?? 0,
      );

Map<String, dynamic> _$RedemptionHistoryResultToJson(RedemptionHistoryResult instance) => <String, dynamic>{
  'items' : instance.items.map((e) => e.toJson()).toList(),
  'pageIndex' : instance.pageIndex,
  'pageSize' : instance.pageSize,
  'totalRecords' : instance.totalRecords,
  'pageCount' : instance.pageCount,
};

RedemptionHistoryItem _$RedemptionHistoryItemFromJson(Map<String, dynamic> json) =>
    RedemptionHistoryItem(
      id: json['id'] ?? 0,
      userAppId: json['userAppId'] ?? 0,
      userName: json['userName'] ?? '',
      rewardId: json['rewardId'] ?? 0,
      rewardName: json['rewardName'] ?? '',
      dateAdded: DateTime.tryParse(json['dateAdded'] ?? '') ?? DateTime.now(),
      quantity: _parseData(json['quantity']),
      totalPointsSpent: json['totalPointsSpent'] ?? 0,
    );

_parseData(dynamic quantity) {
  if (quantity is double) {
    return quantity;
  } else {
    return quantity.toDouble();
  }
}

Map<String, dynamic> _$RedemptionHistoryItemToJson(RedemptionHistoryItem instance) => <String, dynamic>{
  'id' : instance.id,
  'userAppId' : instance.userAppId,
  'userName' : instance.userName,
  'rewardId' : instance.rewardId,
  'rewardName' : instance.rewardName,
  'dateAdded' : instance.dateAdded.toIso8601String(),
  'quantity' : instance.quantity,
  'totalPointsSpent' : instance.totalPointsSpent,
};
