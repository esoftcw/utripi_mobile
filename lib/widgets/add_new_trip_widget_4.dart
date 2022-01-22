import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '/widgets/wizard_buttons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddNewTripWidget4 extends StatelessWidget {
  AddNewTripWidget4(
      {required this.controller,
      required this.cDuration,
      required this.cCurve});

  PageController controller;
  var cDuration;
  var cCurve;
  final _formKey = GlobalKey<FormState>();
  final _locationTextController = TextEditingController();

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
    cityName = '${place.locality}';
    print(place.locality);
    return cityName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Starting Destination'),
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
                    'assets/images/svg/loc.svg',
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.width * 0.5,
                  ),
                ],
              ),
              Text('Enter the Start Destination'),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _locationTextController,
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.location_on_rounded),
                      hintText: 'Start Location',
                      labelText: 'Start Location',
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  Position position = await getLocationCoordinates();
                  String cityName = await getAddressFromCoordinates(position);

                  _locationTextController.text = cityName;
                },
                child: const Text('Get Current Location'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.2,
              ),
              WizardButtons(
                  controller: controller, cDuration: cDuration, cCurve: cCurve),
            ],
          ),
        ),
      ),
    );
  }
}
