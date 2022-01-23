// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Trip _$$_TripFromJson(Map<String, dynamic> json) => _$_Trip(
      uid: json['uid'] as String,
      name: json['name'] as String?,
      startAt: json['startAt'] == null
          ? null
          : DateTime.parse(json['startAt'] as String),
      endAt: json['endAt'] == null
          ? null
          : DateTime.parse(json['endAt'] as String),
      startLocation: json['startLocation'] as String?,
      startPlaceId: json['startPlaceId'] as String?,
      endLocation: json['endLocation'] as String?,
      endPlaceId: json['endPlaceId'] as String?,
      headCount: json['headCount'] as int?,
      transportMode: json['transportMode'] as String?,
    );

Map<String, dynamic> _$$_TripToJson(_$_Trip instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'startAt': instance.startAt?.toIso8601String(),
      'endAt': instance.endAt?.toIso8601String(),
      'startLocation': instance.startLocation,
      'startPlaceId': instance.startPlaceId,
      'endLocation': instance.endLocation,
      'endPlaceId': instance.endPlaceId,
      'headCount': instance.headCount,
      'transportMode': instance.transportMode,
    };
