import 'edit_trip_screen.dart';
import '/widgets/trip_details_screen/5_places_suggestion_widget.dart';
import '/widgets/trip_details_screen/4_costing_widget.dart';
import 'package:flutter/material.dart';
import '/widgets/trip_details_screen/3_weather_details.dart';
import '/widgets/trip_details_screen/2_location_details_widget.dart';
import '/widgets/trip_details_screen/1_time_frame_widget.dart';
import '/widgets/side_bar.dart';

class TripDetailsScreen extends StatefulWidget {
  static const routeName = '/trip-details';
  const TripDetailsScreen({Key? key}) : super(key: key);

  @override
  _TripDetailsScreenState createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details of Trip"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditTripScreen.routeName);
              },
              icon: Icon(Icons.edit))
        ],
      ),
      drawer: SideBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TimeFrameWidget(),
              Divider(),
              LocationDetailsWidget(),
              Divider(),
              WeatherDetailsWidget(),
              Divider(),
              CostingWidget(),
              Divider(),
              PlacesSugestionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
