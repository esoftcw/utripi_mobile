import '/widgets/wizard_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddNewTripWidget5 extends StatelessWidget {
  AddNewTripWidget5(
      {required this.controller,
      required this.cDuration,
      required this.cCurve});
  final _formKey = GlobalKey<FormState>();

  PageController controller;
  var cDuration;
  var cCurve;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('End Destination'),
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
                    'assets/images/svg/road.svg',
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.width * 0.5,
                  ),
                ],
              ),
              Text('Enter the End Destination'),
              Padding(
                padding: const EdgeInsets.all(50),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.location_city_sharp),
                      hintText: 'End Location',
                      labelText: 'End Location',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.2,
              ),
              WizardButtons(
                  controller: controller, cDuration: cDuration, cCurve: cCurve),
            ],
          ),
        ),
      ),
    );
  }
}
