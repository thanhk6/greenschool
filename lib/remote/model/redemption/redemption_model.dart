import 'package:freezed_annotation/freezed_annotation.dart';

part 'redemption_model.g.dart';

@JsonSerializable()
class RedemptionModel {
  String message;
  int statusCode;
  dynamic data;

  RedemptionModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory RedemptionModel.fromJson(Map<String, dynamic> json) =>
      _$RedemptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$RedemptionModelToJson(this);
}

@JsonSerializable()
class RedemptionData {
  int id;
  int userAppId;
  String userName;
  int rewardId;
  String rewardName;
  String dateAdded;
  int quantity;
  int totalPointsSpent;

  RedemptionData({
    required this.id,
    required this.userAppId,
    required this.userName,
    required this.rewardId,
    required this.rewardName,
    required this.dateAdded,
    required this.quantity,
    required this.totalPointsSpent,
  });

  factory RedemptionData.fromJson(Map<String, dynamic> json) =>
      _$RedemptionDataFromJson(json);
  Map<String, dynamic> toJson() => _$RedemptionDataToJson(this);
}


class RedemptionFailed {
  bool isSuccessed;
  String message;
  bool resultObj;

  RedemptionFailed({
    required this.isSuccessed,
    required this.message,
    required this.resultObj,
  });

  factory RedemptionFailed.fromJson(Map<String, dynamic> json) =>
      _$RedemptionFailedFromJson(json);

  Map<String, dynamic> toJson() => _$RedemptionFailedToJson(this);
}