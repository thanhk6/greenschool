
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward_model.g.dart';

@JsonSerializable()
class RewardModel {
  String message;
  int statusCode;
  RewardData data;

  RewardModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory RewardModel.fromJson(Map<String, dynamic> json) =>
      _$RewardModelFromJson(json);
  Map<String, dynamic> toJson() => _$RewardModelToJson(this);
}

@JsonSerializable()
class RewardData {
  List<RewardItem> items;
  int pageIndex;
  int pageSize;
  int totalRecords;
  int pageCount;

  RewardData({
    required this.items,
    required this.pageIndex,
    required this.pageSize,
    required this.totalRecords,
    required this.pageCount,
  });

  factory RewardData.fromJson(Map<String, dynamic> json) =>
      _$RewardDataFromJson(json);
  Map<String, dynamic> toJson() => _$RewardDataToJson(this);
}

@JsonSerializable()
class RewardItem {
  int id;
  String name;
  String description;
  int pointCost;
  int stock;
  DateTime dateAdded;

  RewardItem({
    required this.id,
    required this.name,
    required this.description,
    required this.pointCost,
    required this.stock,
    required this.dateAdded,
  });

  factory RewardItem.fromJson(Map<String, dynamic> json) =>
      _$RewardItemFromJson(json);
  Map<String, dynamic> toJson() => _$RewardItemToJson(this);
}
