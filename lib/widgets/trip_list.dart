import 'package:flutter/material.dart';

class TripList extends StatelessWidget {
  const TripList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
          title: Text('Ella Trip'),
          subtitle: Text('Road Trip'),
          trailing: Image(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/sample.jpg"),
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
