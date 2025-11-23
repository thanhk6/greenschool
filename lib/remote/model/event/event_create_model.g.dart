part of 'event_create_model.dart';

EventCreateModel _$EventCreateFromJson(Map<String, dynamic> json) =>
    EventCreateModel(
      userAppId: json['userAppId'],
      binId: json['binId'],
      quantity: json['quantity'],
    );

Map<String, dynamic> _$EventCreateToJson(EventCreateModel instance) =>
    <String, dynamic>{
      'userAppId': instance.userAppId,
      'binId': instance.binId,
      'quantity': instance.quantity,
    };
