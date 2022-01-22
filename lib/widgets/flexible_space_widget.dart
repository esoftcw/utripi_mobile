import 'package:flutter/material.dart';
import 'dart:convert';
import '/util/string_extensions.dart';
import 'package:geolocator/geolocator.dart';
import '/models/weather.dart';
import 'package:http/http.dart' as http;

class FlexibleSpaceBackground extends StatefulWidget {
  @override
  State<FlexibleSpaceBackground> createState() =>
      _FlexibleSpaceBackgroundState();
}

String greetingMessage() {
  var timeNow = DateTime.now().hour;

  if (timeNow <= 12) {
    return 'Good Morning';
  } else if ((timeNow > 12) && (timeNow <= 16)) {
    return 'Good Afternoon';
  } else if ((timeNow > 16) && (timeNow < 20)) {
    return 'Good Evening';
  } else {
    return 'Good Night';
  }
}

class _FlexibleSpaceBackgroundState extends State<FlexibleSpaceBackground> {
  Future<Position> getLocationCoordinates() async {
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

  Future getForecast(Position position) async {
    late Weather currentWeather;
    Position position = await getLocationCoordinates();
    print(position);
    String apiKey = "e82cd2c889d6e07ddd5bba117cc6052d";
    double lat = position.latitude;
    double lon = position.longitude;
    Uri url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric");
    final response = await http.get(url);

    currentWeather = Weather.fromJson(jsonDecode(response.body));
    print(response.body);

    return currentWeather;
  }

  Future<Weather> getWeather() async {
    Weather weather;
    Position position = await getLocationCoordinates();
    weather = await getForecast(position);
    return weather;
  }

  var userNameText = RichText(
    text: TextSpan(
      style: const TextStyle(
        fontSize: 14.0,
        color: Colors.black,
      ),
      children: <TextSpan>[
        TextSpan(
          text: 'Hello ',
          style: const TextStyle(fontSize: 20),
        ),
        TextSpan(
          text: 'Hutto!',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getWeather(),
      builder: (BuildContext context, AsyncSnapshot<Weather> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.only(
            top: 90,
            left: 15,
            right: 15,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    userNameText,
                    Text(
                      greetingMessage(),
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 5),
                              child: Image.network(snapshot.data!.iconUrl,
                                  height:
                                      MediaQuery.of(context).size.width * 0.11,
                                  fit: BoxFit.cover),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              ('${snapshot.data!.tempreature} °C'),
                              style: TextStyle(fontSize: 26),
                            ),
                            Text(
                              snapshot.data!.description
                                  .toString()
                                  .capitalizeFirstOfEach,
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
