import 'package:provider/provider.dart';
import 'package:utripi/services/database_service.dart';
import 'package:utripi/services/trip_service.dart';

import '/screens/trip_details_screen.dart';
import '/widgets/wizard_buttons.dart';
import '/widgets/transport_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddTripTransportMode extends StatefulWidget {
  AddTripTransportMode(
      {required this.controller,
      required this.cDuration,
      required this.cCurve});

  PageController controller;
  var cDuration;
  var cCurve;

  @override
  State<AddTripTransportMode> createState() => _AddTripTransportModeState();
}

class _AddTripTransportModeState extends State<AddTripTransportMode> {
  final _formKey = GlobalKey<FormState>();
  String _selectedTransportMode = "Car";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transportation Mode'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/svg/car.svg',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.width * 0.6,
                ),
              ],
            ),
            const Text('What is the transportation mode?'),
            const SizedBox(
              height: 25,
            ),
            GridView.count(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              crossAxisCount: 4,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 1.0,
              children: List.generate(
                choices.length,
                (index) {
                  return Center(
                    child: TransportSelection(
                        choice: choices[index],
                        onSelect: (value) {
                          setState(() {
                            _selectedTransportMode = value;
                          });
                        },
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 48,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextButton(
                  child: Text(
                    'Prev',
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    widget.controller.previousPage(duration: widget.cDuration, curve: widget.cCurve);
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.3,
                ),
                TextButton(
                  child: Text(
                    'Proceed',
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    Provider.of<TripBuilderService>(context, listen: false).setTransportMode(_selectedTransportMode);
                    var trip = Provider.of<TripBuilderService>(context, listen: false).trip!;
                    Provider.of<DatabaseService>(context, listen: false).createTrip(trip);
                   /* Navigator.of(context)
                        .pushNamed(TripDetailsScreen.routeName);*/
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
