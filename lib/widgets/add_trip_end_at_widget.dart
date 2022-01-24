import 'package:provider/provider.dart';
import 'package:utripi/services/trip_service.dart';

import '/widgets/wizard_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddTripEndAtWidget extends StatefulWidget {
  AddTripEndAtWidget(
      {required this.controller,
      required this.cDuration,
      required this.cCurve});

  PageController controller;
  var cDuration;
  var cCurve;

  @override
  State<AddTripEndAtWidget> createState() => _AddTripEndAtWidgetState();
}

class _AddTripEndAtWidgetState extends State<AddTripEndAtWidget> {
  final _formKey = GlobalKey<FormState>();

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
      appBar: AppBar(
        title: Text('End Time & Date'),
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
                    'assets/images/svg/travel1.svg',
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.width * 0.5,
                  ),
                ],
              ),
              const Text('Select the end date & time.'),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.date_range_rounded),
                          hintText:
                              '${selectedEndDate.day}/${selectedEndDate.month}/${selectedEndDate.year}',
                          enabled: false,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _selectEndDate(context);
                      },
                      child: const Text("Select End Date"),
                    ),
                    Form(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.av_timer_outlined),
                          hintText:
                              "${selectedEndTime.hour}:${selectedEndTime.minute}",
                          enabled: false,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _selectEndTime(context);
                      },
                      child: const Text("Select End Time"),
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
                  Provider.of<TripBuilderService>(context, listen: false).setEndAt(selectedEndDate);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
