import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';

part 'location.g.dart';

@freezed
class Location with _$Location {
  const Location._();

  factory Location(
      {
        required String name,
        required String placeId,
        required double lat,
        required double lon,
      }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}
