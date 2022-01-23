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

    void setEndAt(DateTime startAt) {
      _trip = _trip!.copyWith(startAt: startAt);
    }

    void startLocation(String startLocation, String placeId) {
      _trip = _trip!.copyWith(startLocation: startLocation, startPlaceId: placeId);
    }

    void endLocation(String endLocation, String placeId) {
      _trip = _trip!.copyWith(endLocation: endLocation, endPlaceId: placeId);
    }

    void setHeadCount(int headCount) {
      _trip = _trip!.copyWith(headCount: headCount);
    }

    void setTransportMode(String transportMode) {
      _trip = _trip!.copyWith(transportMode: transportMode);
    }
}