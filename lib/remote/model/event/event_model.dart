import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventModel {
  String message;
  int statusCode;
  EventData data;

  EventModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}

@JsonSerializable()
class EventData {
  bool isSuccessed;
  String message;
  EventResult resultObj;

  EventData({
    required this.isSuccessed,
    required this.message,
    required this.resultObj,
  });

  factory EventData.fromJson(Map<String, dynamic> json) =>
      _$EventDataFromJson(json);
  Map<String, dynamic> toJson() => _$EventDataToJson(this);
}

@JsonSerializable()
class EventResult {
  int id;
  int userAppId;
  String userName;
  int binId;
  String binCode;
  int unitId;
  String unitName;
  int quantity;
  String wasteTypeName;
  int earnedPoints;
  String dateAdded;

  EventResult({
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

  factory EventResult.fromJson(Map<String, dynamic> json) =>
      _$EventResultFromJson(json);
  Map<String, dynamic> toJson() => _$EventResultToJson(this);
}
