import 'package:flutter/material.dart';
import '/widgets/add_trip_transport_mode_widget.dart';
import '/widgets/add_trip_head_count_widget.dart';
import '/widgets/add_trip_end_location_widget.dart';
import '/widgets/add_trip_start_location_widget.dart';
import '/widgets/add_trip_end_at_widget.dart';
import '/widgets/add_trip_start_at_widget.dart';
import '/widgets/add_trip_name_widget.dart';

class AddNewTrip extends StatefulWidget {
  static const routeName = '/add-new-trip';

  @override
  _AddNewTripState createState() => _AddNewTripState();
}

class _AddNewTripState extends State<AddNewTrip> {
  PageController controller = PageController(
    initialPage: 0,
  );
  static const cDuration = Duration(milliseconds: 300);
  static const cCurve = Curves.ease;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [
          AddTripNameWidget(
            controller: controller,
            cCurve: cCurve,
            cDuration: cDuration,
          ),
          AddTripStartAtWidget(
            controller: controller,
            cCurve: cCurve,
            cDuration: cDuration,
          ),
          AddTripEndAtWidget(
            controller: controller,
            cCurve: cCurve,
            cDuration: cDuration,
          ),
          AddStartLocationWidget(
            controller: controller,
            cCurve: cCurve,
            cDuration: cDuration,
          ),
          AddTripEndLocationWidget(
            controller: controller,
            cCurve: cCurve,
            cDuration: cDuration,
          ),
          AddTripHeadCountWidget(
            controller: controller,
            cCurve: cCurve,
            cDuration: cDuration,
          ),
          AddTripTransportMode(
            controller: controller,
            cCurve: cCurve,
            cDuration: cDuration,
          ),
        ],
      ),
    );
  }
}
