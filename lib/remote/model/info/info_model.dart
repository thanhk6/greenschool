import 'package:freezed_annotation/freezed_annotation.dart';

part 'info_model.g.dart';

@JsonSerializable()
class InfoModel {
  String message;
  int statusCode;
  InfoData data;

  InfoModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });
  
  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);

  Map<String,dynamic>toJson() => _$InfoModelToJson(this);
}

@JsonSerializable()
class InfoData {
  bool isSuccessed;
  String message;
  InfoResult resultObj;

  InfoData({
    required this.isSuccessed,
    required this.message,
    required this.resultObj,
  });

  factory InfoData.fromJson(Map<String, dynamic> json) =>
      _$InfoDataFromJson(json);

  Map<String,dynamic>toJson() => _$InfoDataToJson(this);
}

@JsonSerializable()
class InfoResult {
  int id;
  int userAppId;
  String totalPoints;
  String pointsToAdd;
  String fullName;
  DateTime updateAt;

  InfoResult({
    required this.id,
    required this.userAppId,
    required this.totalPoints,
    required this.pointsToAdd,
    required this.fullName,
    required this.updateAt,
  });

  factory InfoResult.fromJson(Map<String, dynamic> json) =>
      _$InfoResultFromJson(json);

  Map<String,dynamic>toJson() => _$InfoResultoJson(this);
}
