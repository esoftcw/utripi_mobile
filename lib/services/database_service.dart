import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:utripi/models/trip/trip.dart';


class DatabaseService extends ChangeNotifier {

/*  Stream<Trip> trips(String uid) {
    final trips = FirebaseFirestore.instance.collection(_tripCollection(uid));
    final snapshots = trips.snapshots();
    return snapshots.map((snapshot) => Trip.fromJson(snapshot.docs));
  }*/

  String _tripCollection(String uid) {
    return "trips";
  }

  Future<void> createTrip(Trip trip) async {
    var userTrips = FirebaseFirestore.instance.collection(_tripCollection(trip.uid));
    userTrips.add(trip.toJson());
    notifyListeners();
  }

}