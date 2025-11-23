import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {
  String message;
  int statusCode;
  dynamic data;

  RegisterModel({required this.message, required this.statusCode, this.data});

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}

class RegisterDataFailed {
  bool isSuccessed;
  String message;
  bool resultObj;

  RegisterDataFailed({
    required this.isSuccessed,
    required this.message,
    required this.resultObj,
  });

  factory RegisterDataFailed.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataFailedFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDataFailedToJson(this);
}
