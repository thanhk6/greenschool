import 'package:freezed_annotation/freezed_annotation.dart';

part 'r_history.g.dart';

@JsonSerializable()
class RedemptionHistoryModel {
  bool isSuccessed;
  String message;
  RedemptionHistoryResult data;

  RedemptionHistoryModel({
    required this.isSuccessed,
    required this.message,
    required this.data,
  });

  factory RedemptionHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$RedemptionHistoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$RedemptionHistoryModelToJson(this);
}

@JsonSerializable()
class RedemptionHistoryResult {
  List<RedemptionHistoryItem> items;
  int pageIndex;
  int pageSize;
  int totalRecords;
  int pageCount;

  RedemptionHistoryResult({
    required this.items,
    required this.pageIndex,
    required this.pageSize,
    required this.totalRecords,
    required this.pageCount,
  });

  factory RedemptionHistoryResult.fromJson(Map<String, dynamic> json) =>
      _$RedemptionHistoryResultFromJson(json);
  Map<String, dynamic> toJson() => _$RedemptionHistoryResultToJson(this);
}

@JsonSerializable()
class RedemptionHistoryItem {
  int id;
  int userAppId;
  String userName;
  int rewardId;
  String rewardName;
  DateTime dateAdded;
  double quantity;
  int totalPointsSpent;

  RedemptionHistoryItem({
    required this.id,
    required this.userAppId,
    required this.userName,
    required this.rewardId,
    required this.rewardName,
    required this.dateAdded,
    required this.quantity,
    required this.totalPointsSpent,
  });

  factory RedemptionHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$RedemptionHistoryItemFromJson(json);
  Map<String, dynamic> toJson() => _$RedemptionHistoryItemToJson(this);
}
