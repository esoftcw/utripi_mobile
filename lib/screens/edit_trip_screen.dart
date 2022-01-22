import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class EditTripScreen extends StatefulWidget {
  const EditTripScreen({Key? key}) : super(key: key);
  static const routeName = '/edit-trip';

  @override
  _EditTripScreenState createState() => _EditTripScreenState();
}

class _EditTripScreenState extends State<EditTripScreen> {
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
      setState(
        () {
          selectedStartingTime = timeOfDay;
        },
      );
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
      setState(
        () {
          selectedStartingDate = selectedDate;
        },
      );
  }

  int _headCount = 2;
  DateTime selectedEndDate = DateTime.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();

  _selectEndTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedEndTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedEndTime) {
      setState(() {
        selectedEndTime = timeOfDay;
      });
    }
  }

  _selectEndDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: selectedEndDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selectedDate != null && selectedDate != selectedEndDate)
      setState(() {
        selectedEndDate = selectedDate;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Edit Trip Details',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Trip Name',
                          labelText: 'Trip Name',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Transport Type',
                          labelText: 'Transport Type',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'Start Location',
                          labelText: 'Start location',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: 'End Location',
                          labelText: 'End location',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          NumberPicker(
                            axis: Axis.horizontal,
                            value: _headCount,
                            minValue: 0,
                            maxValue: 100,
                            onChanged: (value) =>
                                setState(() => _headCount = value),
                          ),
                          Text(
                            'Head Count: $_headCount',
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                            ),
                            child: Text(
                              'Start Date',
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.date_range_rounded),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.av_timer_outlined),
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 15),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                              ),
                              child: Text(
                                'End Date',
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.date_range_rounded),
                              hintText:
                                  '${selectedEndDate.day}/${selectedEndDate.month}/${selectedEndDate.year}',
                              enabled: false,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              _selectEndDate(context);
                            },
                            child: const Text("Select End Date"),
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.av_timer_outlined),
                              hintText:
                                  "${selectedEndTime.hour}:${selectedEndTime.minute}",
                              enabled: false,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              _selectEndTime(context);
                            },
                            child: const Text("Select End Time"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Proceed',
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
