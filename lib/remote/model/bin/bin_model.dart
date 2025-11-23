import 'package:freezed_annotation/freezed_annotation.dart';

part 'bin_model.g.dart';

@JsonSerializable()
class BinModel {
  String message;
  int statusCode;
  BinData data;

  BinModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory BinModel.fromJson(Map<String, dynamic> json) =>
      _$BinModelFromJson(json);

  Map<String, dynamic> toJson() => _$BinModelToJson(this);
}

@JsonSerializable()
class BinData {
  bool isSuccessed;
  String message;
  BinResult resultObj;

  BinData({
    required this.isSuccessed,
    required this.message,
    required this.resultObj,
  });

  factory BinData.fromJson(Map<String, dynamic> json) =>
      _$BinDataFromJson(json);
  Map<String, dynamic> toJson() => _$BinDataToJson(this);
}

@JsonSerializable()
class BinResult {
  int userAppId;
  String username;
  int binId;
  String qrCode;
  int wasteTypeId;
  String wasteTypeName;
  int locationId;
  String locationName;
  String address;
  int unitId;
  String unitName;

  BinResult({
    required this.userAppId,
    required this.username,
    required this.binId,
    required this.qrCode,
    required this.wasteTypeId,
    required this.wasteTypeName,
    required this.locationId,
    required this.locationName,
    required this.address,
    required this.unitId,
    required this.unitName,
  });

  factory BinResult.fromJson(Map<String, dynamic> json) =>
      _$BinResultFromJson(json);
  Map<String, dynamic> toJson() => _$BinResultToJson(this);
}
