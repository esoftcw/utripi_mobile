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
      startLocation: json['startLocation'] == null
          ? null
          : Location.fromJson(json['startLocation'] as Map<String, dynamic>),
      endLocation: json['endLocation'] == null
          ? null
          : Location.fromJson(json['endLocation'] as Map<String, dynamic>),
      headCount: json['headCount'] as int?,
      transportMode: json['transportMode'] as String?,
    );

Map<String, dynamic> _$$_TripToJson(_$_Trip instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'startAt': instance.startAt?.toIso8601String(),
      'endAt': instance.endAt?.toIso8601String(),
      'startLocation': instance.startLocation?.toJson(),
      'endLocation': instance.endLocation?.toJson(),
      'headCount': instance.headCount,
      'transportMode': instance.transportMode,
    };
