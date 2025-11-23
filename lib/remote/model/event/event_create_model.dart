import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_create_model.g.dart';

@JsonSerializable()
class EventCreateModel {
  int userAppId;
  int binId;
  int quantity;

  EventCreateModel({required this.userAppId, required this.binId, required this.quantity});

  factory EventCreateModel.fromJson(Map<String, dynamic> json) =>
      _$EventCreateFromJson(json);

  Map<String, dynamic> toJson() => _$EventCreateToJson(this);
}
