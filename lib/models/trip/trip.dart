import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip.freezed.dart';

@freezed
class Trip with _$Trip {
  const Trip._();
  factory Trip({required String name}) = _Trip;

  static Trip fromDoc(var doc) {
    return Trip(
      name: "",
    );
  }
}