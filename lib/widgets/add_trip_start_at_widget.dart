import 'package:provider/provider.dart';
import 'package:utripi/services/auth_service.dart';
import 'package:utripi/services/database_service.dart';
import 'package:utripi/services/trip_service.dart';
import 'package:utripi/widgets/wizard_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddTripStartAtWidget extends StatefulWidget {
  AddTripStartAtWidget(
      {required this.controller,
      required this.cDuration,
      required this.cCurve});

  PageController controller;
  var cDuration;
  var cCurve;

  @override
  State<AddTripStartAtWidget> createState() => _AddTripStartAtWidgetState();
}

class _AddTripStartAtWidgetState extends State<AddTripStartAtWidget> {
  final _formKey = GlobalKey<FormState>();

  DateTime selectedStartingDate = DateTime.now();
  TimeOfDay selectedStartingTime = TimeOfDay.now();

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedStartingTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedStartingTime) {
      setState(() {
        selectedStartingTime = timeOfDay;
      });
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: selectedStartingDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selectedDate != null && selectedDate != selectedStartingDate)
      setState(() {
        selectedStartingDate = selectedDate;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start Time & Date'),
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
                  'assets/images/svg/signup.svg',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.width * 0.5,
                ),
              ],
            ),
            Text('Select the starting date & time.'),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.date_range_rounded),
                        hintText:
                            '${selectedStartingDate.day}/${selectedStartingDate.month}/${selectedStartingDate.year}',
                        enabled: false,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    child: const Text("Select Start Date"),
                  ),
                  Form(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.av_timer_outlined),
                        hintText:
                            "${selectedStartingTime.hour}:${selectedStartingTime.minute}",
                        enabled: false,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _selectTime(context);
                    },
                    child: const Text("Select Start Time"),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.01,
            ),
            WizardButtons(
                controller: widget.controller,
                cDuration: widget.cDuration,
                cCurve: widget.cCurve,
                onPress: () {
                  // Test code,
                   Provider.of<TripBuilderService>(context, listen: false).setStartAt(selectedStartingDate);
                  // var trip = Provider.of<TripBuilderService>(context, listen: false).trip!;
                  // Provider.of<DatabaseService>(context, listen: false).createTrip(trip);
                },
            ),
          ],
        )),
      ),
    );
  }
}
