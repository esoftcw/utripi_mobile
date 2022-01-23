import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip.freezed.dart';

part 'trip.g.dart';

@freezed
class Trip with _$Trip {
  const Trip._();

  factory Trip(
      {required String uid,
      String? name,
      DateTime? startAt,
      DateTime? endAt,
      String? startLocation,
      String? startPlaceId,
      String? endLocation,
      String? endPlaceId,
      int? headCount,
      String? transportMode,
      }) = _Trip;

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);
}
