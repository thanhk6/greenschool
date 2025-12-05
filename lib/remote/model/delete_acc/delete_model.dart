import 'package:green_school/remote/model/forgot_password/convert_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_model.g.dart';

@JsonSerializable()
class DeleteModel {
  String message;
  int statusCode;
  @DataOrBoolConverter()
  final dynamic data;

  DeleteModel({
    required this.message,
    required this.statusCode,
    this.data,
  });

  factory DeleteModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteModelFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteModelToJson(this);
}

@JsonSerializable()
class Data {
  bool isSuccess;
  String message;
  bool resultObj;

  Data({
    required this.isSuccess,
    required this.message,
    required this.resultObj,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
