import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_model.g.dart';

@JsonSerializable()
class AiModel {
  bool success;
  bool isCorrect;
  dynamic data;

  AiModel({required this.success, required this.isCorrect, required this.data});

  factory AiModel.fromJson(Map<String, dynamic> json) =>
      _$AiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AiModelToJson(this);
}

@JsonSerializable()
class AiData {
  int id;
  String name;
  int pointsPerUnit;
  int unitId;
  String unintName;
  String dateAdded;

  AiData({
    required this.id,
    required this.name,
    required this.pointsPerUnit,
    required this.unitId,
    required this.unintName,
    required this.dateAdded,
  });

  factory AiData.fromJson(Map<String, dynamic> json) => _$AiDataFromJson(json);
  Map<String, dynamic> toJson() => _$AiDataToJson(this);
}
