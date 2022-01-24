import 'package:utripi/models/trip/location.dart';
import 'package:utripi/models/trip/trip.dart';

class TripBuilderService {
    Trip? _trip;

    Trip? get trip => _trip;

    void init(String uid) {
      _trip = Trip(uid: uid);
    }

    void setName(String name) {
      _trip = _trip!.copyWith(name: name);
    }

    void setStartAt(DateTime startAt) {
      _trip = _trip!.copyWith(startAt: startAt);
    }

    void setEndAt(DateTime endAt) {
      _trip = _trip!.copyWith(endAt: endAt);
    }

    void startLocation(Location startLocation) {
      _trip = _trip!.copyWith(startLocation: startLocation);
    }

    void endLocation(Location endLocation) {
      _trip = _trip!.copyWith(endLocation: endLocation);
    }

    void setHeadCount(int headCount) {
      _trip = _trip!.copyWith(headCount: headCount);
    }

    void setTransportMode(String transportMode) {
      _trip = _trip!.copyWith(transportMode: transportMode);
    }

    // Future<Trip> build() async {
    //   return _trip;
    // }
}