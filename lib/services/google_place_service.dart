import 'dart:typed_data';
import 'package:google_place/google_place.dart';
import 'package:google_place/google_place.dart' hide Location;
import 'package:utripi/models/trip/location.dart' as M;

class GooglePlaceService {
  late GooglePlace googlePlace;

  GooglePlaceService._() {
    //TODO move to .env
    googlePlace = GooglePlace("AIzaSyDLEcoEk1LlGVsFHVN0EKALRAtcOyNbaIE");
  }

  static final GooglePlaceService _instance = GooglePlaceService._();

  static GooglePlaceService get instance => _instance;

  Future<DetailsResult?> getDetails(String placeId) async {
    var response = await googlePlace.details.get(placeId);
    if (response != null) {
      response.result;
    }
  }

  Future<Uint8List?> getPhoto(String photoReference, int width, int height) async {
    return googlePlace.photos.get(photoReference, width, height);
  }

  Future<Uint8List?> getFeaturedImage(String placeId) async {
    var placeDetails = await getDetails(placeId);
    if (placeDetails!.photos != null) {
      return getPhoto(placeDetails.photos![0].photoReference!, 400, 400);
    }

    return null;
  }


  Future<M.Location> getLocation(String placeId) async {
    var details = await getDetails(placeId);
    return M.Location(
        name: details!.name!,
        lat: details.geometry!.location!.lat!,
        lon: details.geometry!.location!.lng!,
        placeId: placeId
    );
  }



}