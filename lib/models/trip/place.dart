import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';

@freezed
class Place with _$Place {
  const Place._();

  factory Place(
      {
        required String name,
        required Uint8List photo,
      }) = _Place;

}
