part of 'ai_model.dart';

AiModel _$AiModelFromJson(Map<String, dynamic> json) => AiModel(
  success: json['success'] ?? false,
  isCorrect: json['isCorrect'] ?? false,
  data: _parseData(json['data']),
);

dynamic _parseData(dynamic data) {
  if (data is String) {
    return data;
  } else if (data is Map<String, dynamic>) {
    return AiData.fromJson(data);
  }
  return null;
}

Map<String, dynamic> _$AiModelToJson(AiModel instance) => <String, dynamic>{
  'success': instance.success,
  'isCorrect': instance.isCorrect,
  'data': instance.data is AiData ? (instance.data as AiData).toJson() : instance.data,
};

AiData _$AiDataFromJson(Map<String, dynamic> json) => AiData(
  id: json['id'] ?? 0,
  name: json['name'] ?? '',
  pointsPerUnit: json['pointsPerUnit'] ?? 0,
  unitId: json['unitId'] ?? 0,
  unintName: json['unintName'] ?? '',
  dateAdded: json['dateAdded'] ?? '',
);

Map<String, dynamic> _$AiDataToJson(AiData instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'pointsPerUnit': instance.pointsPerUnit,
  'unitId': instance.unitId,
  'unintName': instance.unintName,
  'dateAdded': instance.dateAdded,
};
