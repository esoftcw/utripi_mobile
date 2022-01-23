import 'package:flutter/material.dart';

class Choice {
  const Choice({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.emoji_transportation_sharp),
  const Choice(title: 'Bus', icon: Icons.bus_alert),
  const Choice(title: 'Train', icon: Icons.train),
  const Choice(title: 'Motor Cycle', icon: Icons.bike_scooter_sharp),
  // const Choice(title: 'Van', icon: Icons.),
  // const Choice(title: 'Setting', icon: Icons.settings),
  // const Choice(title: 'Album', icon: Icons.photo_album),
  // const Choice(title: 'WiFi', icon: Icons.wifi),
];

class TransportSelection extends StatelessWidget {
  const TransportSelection({required this.choice, required this.onSelect});
  final Choice choice;
  final Function onSelect;

  @override
  Widget build(BuildContext context) {
    // final TextStyle? textStyle = Theme.of(context).textTheme.button;
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      child: InkWell(
        onTap: () {
          onSelect(choice.title);
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Icon(
                    choice.icon,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    choice.title,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
