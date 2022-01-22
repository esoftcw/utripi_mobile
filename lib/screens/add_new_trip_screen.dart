import 'package:flutter/material.dart';
import '/widgets/add_new_trip_widget_7.dart';
import '/widgets/add_new_trip_widget_6.dart';
import '/widgets/add_new_trip_widget_5.dart';
import '/widgets/add_new_trip_widget_4.dart';
import '/widgets/add_new_trip_widget_3.dart';
import '/widgets/add_new_trip_widget_2.dart';
import '/widgets/add_new_trip_widget_1.dart';

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
          AddNewTripWidget1(
            controller: controller,
            cCurve: cCurve,
            cDuration: cDuration,
          ),
          AddNewTripWidget2(
            controller: controller,
            cCurve: cCurve,
            cDuration: cDuration,
          ),
          AddNewTripWidget3(
            controller: controller,
            cCurve: cCurve,
            cDuration: cDuration,
          ),
          AddNewTripWidget4(
            controller: controller,
            cCurve: cCurve,
            cDuration: cDuration,
          ),
          AddNewTripWidget5(
            controller: controller,
            cCurve: cCurve,
            cDuration: cDuration,
          ),
          AddNewTripWidget6(
            controller: controller,
            cCurve: cCurve,
            cDuration: cDuration,
          ),
          AddNewTripWidget7(
            controller: controller,
            cCurve: cCurve,
            cDuration: cDuration,
          ),
        ],
      ),
    );
  }
}
