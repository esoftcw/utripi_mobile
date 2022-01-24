import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utripi/models/trip/trip.dart';
import 'package:utripi/screens/trip_details_screen.dart';
import 'package:utripi/services/auth_service.dart';
import 'package:utripi/services/database_service.dart';
import 'package:utripi/services/google_place_service.dart';
import 'package:utripi/services/trip_service.dart';

class TripList extends StatelessWidget {
  const TripList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var uid = Provider.of<AuthService>(context, listen: false).user!.uid;

    return SizedBox(
      height: 500,
      child: Consumer<DatabaseService> (
        builder: (_, databaseService, __) {
          return FutureBuilder<List<Trip>>(
              future: databaseService.getTrip(uid),
              builder: (_, AsyncSnapshot<List<Trip>> trips) {

                if (!trips.hasData) {
                  return Container(color: Colors.blue,);
                }
                return ListView.builder(
                    itemCount: trips.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Provider.of<TripBuilderService>(context, listen: false).setTrip(trips.data![index]);
                          Navigator.of(context)
                              .pushNamed(TripDetailsScreen.routeName);
                        },
                        child: Card(
                          elevation: 5,
                          margin: EdgeInsets.all(5),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(5),
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.pinkAccent,
                              child: Text('3 D'),
                            ),
                            title: Text(trips.data![index].endLocation!.name),
                            subtitle: Text(trips.data![index].name!),
                            trailing: FutureBuilder(
                              future: GooglePlaceService.instance.getFeaturedImage(trips.data![index].endLocation!.placeId),
                              builder: (_, AsyncSnapshot image) {
                                if (!image.hasData) {
                                  return Image(
                                    fit: BoxFit.fill,
                                    image: AssetImage("assets/images/sample.jpg"),
                                    alignment: Alignment.center,
                                  );
                                }
                                return Image.memory(
                                  image.data,
                                  fit: BoxFit.fill,
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    }
                );
              }
          );
        },
      ),
    );
  }
}
