import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:provider/provider.dart';
import 'package:utripi/models/trip/place.dart';
import 'package:utripi/models/trip/trip.dart';
import 'package:utripi/services/google_place_service.dart';
import 'package:utripi/services/trip_service.dart';

class PlacesSugestionWidget extends StatefulWidget {
  const PlacesSugestionWidget({Key? key}) : super(key: key);

  @override
  State<PlacesSugestionWidget> createState() => _PlacesSugestionWidgetState();
}

class _PlacesSugestionWidgetState extends State<PlacesSugestionWidget> {

  List<SearchResult> _places = [];

  @override
  Widget build(BuildContext context) {
    var trip = Provider.of<TripBuilderService>(context, listen: false).trip!;
    getPlaces(trip);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Places to See",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 140,
              width: MediaQuery.of(context).size.width * 0.95,
              child: ListView.builder(
                itemCount: _places.length,
                itemBuilder: (context, index) {
                  return Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(
                      children: [
                       if (_places.isNotEmpty)
                         FutureBuilder(
                           future: GooglePlaceService.instance.getFeaturedImage(_places[index].placeId!),
                           builder: (_, AsyncSnapshot image) {
                             print(_places[index].placeId);
                             if (!image.hasData) {
                               return Image(
                                 fit: BoxFit.fill,
                                 image: AssetImage("assets/images/sample.jpg"),
                                 alignment: Alignment.center,
                               );
                             }
                             return Image.memory(
                               image.data,
                               fit: BoxFit.fill,
                             );
                           },
                         ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Center(child:  Text(_places[index].name!)),
                       )
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                  );
                  // return Card(
                  //   elevation: 5,
                  //   child: Container(
                  //     width: MediaQuery.of(context).size.width * 0.9,
                  //     height: 50,
                  //     child: Center(
                  //       child: Text(_places[index].name!),
                  //     ),
                  //   ),
                  // );
                },
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
              ),
            )
          ],
        ),
        Divider(),
        SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Save Trip',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent, // background
              ),
            ),
          ],
        )
      ],
    );
  }

  void getPlaces(Trip trip) async {
    var places = await GooglePlaceService.instance.googlePlace.search.getNearBySearch(
        Location(lat: trip.endLocation!.lat, lng: trip.endLocation!.lon), 500,
        type: "sights", keyword: "sights");

    setState(() {
      _places = places!.results!;
    });
  }
}
