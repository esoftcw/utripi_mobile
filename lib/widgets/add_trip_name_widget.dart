import 'package:provider/provider.dart';
import 'package:utripi/services/trip_service.dart';
import 'package:utripi/util/validators/required_validator.dart';

import '/widgets/wizard_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:developer';

class AddTripNameWidget extends StatelessWidget {
  AddTripNameWidget(
      {required this.controller,
      required this.cDuration,
      required this.cCurve});
  final _formKey = GlobalKey<FormState>();
  PageController controller;
  final cDuration;
  final cCurve;

  @override
  Widget build(BuildContext context) {
    var tripNameTextController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Trip'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/images/svg/login.svg',
              fit: BoxFit.cover,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.7,
            ),
            Text('Give your itinerary a name.'),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: tripNameTextController,
                  decoration: const InputDecoration(
                    prefixIcon: const Icon(Icons.add_location_rounded),
                    labelText: 'Trip Name',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.2,
            ),
            WizardButtons(
                controller: controller,
                cDuration: cDuration,
                cCurve: cCurve,
                onPress: () {
                  Provider
                      .of<TripBuilderService>(context, listen: false)
                      .setName(tripNameTextController.text);
                },
            )
          ],
        ),
      ),
    );
  }
}
