part of 'collection_model.dart';

CollectionModel _$CollectionModelFromJson(Map<String, dynamic> json) => CollectionModel(
  message: json['message'] ?? '',
  statusCode: json['statusCode'] ?? 0,
  data: CollectionData.fromJson(json['data']),
);

Map<String, dynamic> _$CollectionModelToJson(CollectionModel instance) => <String, dynamic>{
  'message': instance.message,
  'statusCode': instance.statusCode,
  'data': instance.data.toJson(),
};

CollectionData _$CollectionDataFromJson(Map<String, dynamic> json) =>
    CollectionData(
      items: (json['items'] as List<dynamic>?)
          ?.map((item) => CollectionItem.fromJson(item as Map<String, dynamic>))
          .toList()?? [],
      pageIndex: json['pageIndex'] ?? 0,
      pageSize: json['pageSize'] ?? 0,
      totalRecords: json['totalRecords'] ?? 0,
      pageCount: json['pageCount'] ?? 0,
      );

Map<String, dynamic> _$CollectionDataToJson(CollectionData instance) => <String, dynamic>{
  'items' : instance.items.map((e) => e.toJson()).toList(),
  'pageIndex' : instance.pageIndex,
  'pageSize' : instance.pageSize,
  'totalRecords' : instance.totalRecords,
  'pageCount' : instance.pageCount,
};

CollectionItem _$CollectionItemFromJson(Map<String, dynamic> json) =>
    CollectionItem(
      id: json['id'] ?? 0,
      userAppId: json['userAppId'] ?? 0,
      userName: json['userName'] ?? '',
      binId: json['binId'] ?? 0,
      binCode: json['binCode'] ?? '',
      unitId: json['unitId'] ?? 0,
      unitName: json['unitName'] ?? '',
      quantity: _parseData(json['quantity']),
      wasteTypeName: json['wasteTypeName'] ?? '',
      earnedPoints: json['earnedPoints'] ?? 0,
      dateAdded: DateTime.tryParse(json['dateAdded'] ?? '') ?? DateTime.now(),
    );

_parseData(dynamic quantity) {
  if (quantity is double) {
    return quantity;
  } else {
    return quantity.toDouble();
  }
}

Map<String, dynamic> _$CollectionItemToJson(CollectionItem instance) => <String, dynamic>{
  'id' : instance.id,
  'userAppId' : instance.userAppId,
  'userName' : instance.userName,
  'binId' : instance.binId,
  'binCode' : instance.binCode,
  'unitId' : instance.unitId,
  'unitName' : instance.unitName,
  'quantity' : instance.quantity,
  'wasteTypeName' : instance.wasteTypeName,
  'earnedPoints' : instance.earnedPoints,
  'dateAdded' : instance.dateAdded.toIso8601String(),
};
