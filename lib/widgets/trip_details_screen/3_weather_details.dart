import 'package:flutter/material.dart';

class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Weather",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 140,
              width: MediaQuery.of(context).size.width * 0.95,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Card(
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      child: Center(
                        child: Text('Weather Details'),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Center(
                        child: Text('Weather Details'),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
