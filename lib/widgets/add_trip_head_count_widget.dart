import 'package:provider/provider.dart';
import 'package:utripi/services/trip_service.dart';

import '/widgets/wizard_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:numberpicker/numberpicker.dart';

class AddTripHeadCountWidget extends StatefulWidget {
  AddTripHeadCountWidget(
      {required this.controller,
      required this.cDuration,
      required this.cCurve});

  PageController controller;
  var cDuration;
  var cCurve;

  @override
  State<AddTripHeadCountWidget> createState() => _AddTripHeadCountWidgetState();
}

class _AddTripHeadCountWidgetState extends State<AddTripHeadCountWidget> {
  final _formKey = GlobalKey<FormState>();

  int _headCount = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Head Count'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/svg/fam.svg',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.width * 0.5,
                    ),
                  ],
                ),
              ),
              const Text('How many people are going with you?'),
              Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: <Widget>[
                    NumberPicker(
                      value: _headCount,
                      minValue: 0,
                      maxValue: 100,
                      onChanged: (value) => setState(() => _headCount = value),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Text(
                      'Head Count: $_headCount',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
              WizardButtons(
                  controller: widget.controller,
                  cDuration: widget.cDuration,
                  cCurve: widget.cCurve,
                onPress: () {
                  Provider.of<TripBuilderService>(context, listen: false).setHeadCount(_headCount);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
