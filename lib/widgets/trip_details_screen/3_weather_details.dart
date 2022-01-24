import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utripi/util/time_stamp_convertors.dart';
import '/models/trip/forcast.dart';
import 'package:utripi/services/trip_service.dart';
import 'package:http/http.dart' as http;

class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var trip = Provider.of<TripBuilderService>(context, listen: false).trip!;
    var tripLon = trip.endLocation!.lon;
    var tripLat = trip.endLocation!.lat;
    Forecast? forecast;

    Future<Forecast> getForecast(var trip) async {
      late Forecast forecast;
      String apiKey = "e82cd2c889d6e07ddd5bba117cc6052d";
      var lat = trip.endLocation!.lat;
      var lon = trip.endLocation!.lon;
      Uri url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric");
      final response = await http.get(url);

      forecast = Forecast.fromJson(jsonDecode(response.body));
      // print(response.body);
      return forecast;
    }

    return FutureBuilder<Forecast>(
      future: getForecast(trip),
      builder: (BuildContext context, AsyncSnapshot<Forecast> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Daily Weather in ${trip.endLocation!.name}",
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
                  height: 170,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(
                        left: 2, top: 2, bottom: 2, right: 2),
                    itemCount: snapshot.data!.daily.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Column(
                                // mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    height: 25,
                                    child: Text(
                                        '${getDateFromTimestamp(snapshot.data!.daily[index].date)} '),
                                  ),
                                  Container(
                                    height: 30,
                                    child: Text(
                                        '${snapshot.data!.daily[index].temp} °'),
                                  ),
                                  Container(
                                    height: 30,
                                    child: Row(
                                      children: [
                                        Icon(Icons.water_damage_outlined),
                                        Text(
                                            '${snapshot.data!.daily[index].pop} %'),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    child: Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: Image.network(
                                          snapshot.data!.daily[index].iconUrl,
                                          fit: BoxFit.cover),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
