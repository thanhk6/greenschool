import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection_model.g.dart';

@JsonSerializable()
class CollectionModel {
  String message;
  int statusCode;
  CollectionData data;

  CollectionModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory CollectionModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionModelToJson(this);
}

@JsonSerializable()
class CollectionData {
  List<CollectionItem> items;
  int pageIndex;
  int pageSize;
  int totalRecords;
  int pageCount;

  CollectionData({
    required this.items,
    required this.pageIndex,
    required this.pageSize,
    required this.totalRecords,
    required this.pageCount,
  });

  factory CollectionData.fromJson(Map<String, dynamic> json) =>
      _$CollectionDataFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionDataToJson(this);
}

@JsonSerializable()
class CollectionItem {
  int id;
  int userAppId;
  String userName;
  int binId;
  String binCode;
  int unitId;
  String unitName;
  double quantity;
  String wasteTypeName;
  int earnedPoints;
  DateTime dateAdded;

  CollectionItem({
    required this.id,
    required this.userAppId,
    required this.userName,
    required this.binId,
    required this.binCode,
    required this.unitId,
    required this.unitName,
    required this.quantity,
    required this.wasteTypeName,
    required this.earnedPoints,
    required this.dateAdded,
  });

  factory CollectionItem.fromJson(Map<String, dynamic> json) =>
      _$CollectionItemFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionItemToJson(this);
}
