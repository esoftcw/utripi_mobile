import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utripi/services/trip_service.dart';

class CostingWidget extends StatefulWidget {
  const CostingWidget({Key? key}) : super(key: key);

  @override
  State<CostingWidget> createState() => _CostingWidgetState();
}

class _CostingWidgetState extends State<CostingWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var trip = Provider.of<TripBuilderService>(context, listen: false).trip!;
    int days = trip.endAt!.difference(trip.startAt!).inDays;
    int? meal = days == 0 ? trip.headCount : trip.headCount! * days;
   // int cost = remoteConfig.getValue('cph_bus').asInt();
    int cost = 20;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Estimated Costing",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Head Count",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 25,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${trip.headCount} Pax',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Meals",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.set_meal,
                            size: 25,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${meal}',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Cost",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.money,
                            size: 25,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '460, 000/=',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Cost Per-Person",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline_sharp,
                            size: 25,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '${cost}',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
