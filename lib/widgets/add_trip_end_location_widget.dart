import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:provider/provider.dart';
import 'package:utripi/services/trip_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '/widgets/wizard_buttons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddTripEndLocationWidget extends StatefulWidget {
  AddTripEndLocationWidget(
      {required this.controller,
      required this.cDuration,
      required this.cCurve});
  PageController controller;
  var cDuration;
  var cCurve;

  @override
  State<AddTripEndLocationWidget> createState() =>
      _AddTripEndLocationWidgetState();
}

class _AddTripEndLocationWidgetState extends State<AddTripEndLocationWidget> {
  final _formKey = GlobalKey<FormState>();
  final _locationTextController = TextEditingController();

  late GooglePlace googlePlace;
  List<AutocompletePrediction>? predictions = [];

  static Future<Position> getLocationCoordinates() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services unavailable');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permission permanently denied');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  static Future<String> getAddressFromCoordinates(Position position) async {
    String cityName;
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    cityName = '${place.locality} , ${place.country}';
    print(place.locality);
    return cityName;
  }

  @override
  void initState() {
    //TODO move to .env
    googlePlace = GooglePlace("AIzaSyDLEcoEk1LlGVsFHVN0EKALRAtcOyNbaIE");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('End Destination'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/svg/road.svg',
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.width * 0.5,
                  ),
                ],
              ),
              Text('Enter the End Destination'),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _locationTextController,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.location_on_rounded),
                      hintText: 'End Location',
                      labelText: 'End Location',
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        print(_locationTextController.text);
                        autoCompleteSearch(value);
                      } else {
                        if (predictions!.length > 0 && mounted) {
                          setState(() {
                            predictions = [];
                          });
                        }
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
                child: Expanded(
                  child: ListView.builder(
                    itemCount: predictions!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(predictions![index].description!),
                        onTap: () {
                          Provider.of<TripBuilderService>(context,
                                  listen: false)
                              .endLocation(predictions![index].description!,
                                  predictions![index].placeId!);
                          _locationTextController.text =
                              predictions![index].description!;
                          setState(() {
                            predictions = [];
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
              WizardButtons(
                  controller: widget.controller,
                  cDuration: widget.cDuration,
                  cCurve: widget.cCurve),
            ],
          ),
        ),
      ),
    );
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value);
    if (result != null && result.predictions != null && mounted) {
      setState(() {
        predictions = result.predictions;
      });
    }
  }
}
