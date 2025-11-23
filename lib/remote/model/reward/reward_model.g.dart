part of 'reward_model.dart';

RewardModel _$RewardModelFromJson(Map<String, dynamic> json) => RewardModel(
  message: json['message'] ?? '',
  statusCode: json['statusCode'] ?? 0,
  data: RewardData.fromJson(json['data']),
);

Map<String, dynamic> _$RewardModelToJson(RewardModel instance) => <String, dynamic>{
  'message': instance.message,
  'statusCode': instance.statusCode,
  'data': instance.data.toJson(),
};

RewardData _$RewardDataFromJson(Map<String, dynamic> json) =>
    RewardData(
      items: (json['items'] as List<dynamic>?)
          ?.map((item) => RewardItem.fromJson(item as Map<String, dynamic>))
          .toList()?? [],
      pageIndex: json['pageIndex'] ?? 0,
      pageSize: json['pageSize'] ?? 0,
      totalRecords: json['totalRecords'] ?? 0,
      pageCount: json['pageCount'] ?? 0,
      );

Map<String, dynamic> _$RewardDataToJson(RewardData instance) => <String, dynamic>{
  'items' : instance.items.map((e) => e.toJson()).toList(),
  'pageIndex' : instance.pageIndex,
  'pageSize' : instance.pageSize,
  'totalRecords' : instance.totalRecords,
  'pageCount' : instance.pageCount,
};

RewardItem _$RewardItemFromJson(Map<String, dynamic> json) =>
    RewardItem(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      pointCost: json['pointCost'] ?? 0,
      stock: json['stock'] ?? 0,
      dateAdded: DateTime.tryParse(json['dateAdded'] ?? '') ?? DateTime.now(),
    );

Map<String, dynamic> _$RewardItemToJson(RewardItem instance) => <String, dynamic>{
  'id' : instance.id,
  'name' : instance.name,
  'description' : instance.description,
  'pointCost' : instance.pointCost,
  'stock' : instance.stock,
  'dateAdded' : instance.dateAdded.toIso8601String(),
};
