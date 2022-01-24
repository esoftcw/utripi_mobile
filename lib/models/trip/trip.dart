import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'location.dart';

part 'trip.freezed.dart';

part 'trip.g.dart';

@freezed
class Trip with _$Trip {
  const Trip._();

  @JsonSerializable(explicitToJson: true)
  factory Trip(
      {required String uid,
      String? name,
      DateTime? startAt,
      DateTime? endAt,
      Location? startLocation,
      Location? endLocation,
      int? headCount,
      String? transportMode,
      num? distance,
      num? travelTime,
      }) = _Trip;

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
}
