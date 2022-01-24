import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utripi/services/auth_service.dart';
import 'package:utripi/services/trip_service.dart';
import 'add_new_trip_screen.dart';
import '/widgets/trip_list.dart';
import '/widgets/flexible_space_widget.dart';
import '/widgets/side_bar.dart';
import 'edit_profile_screen.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main';

  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.of(context).pushNamed(EditProfileScreen.routeName);
                },
              ),
            ],
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            pinned: true,
            expandedHeight: 160,
            flexibleSpace: FlexibleSpaceBar(
              background: FlexibleSpaceBackground(),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'My Trips',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                TripList(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          var uid = Provider.of<AuthService>(context, listen: false).user!.uid;
          Provider.of<TripBuilderService>(context, listen: false).init(uid);
          Navigator.of(context).pushNamed(AddNewTrip.routeName);
        },
        icon: Icon(Icons.add),
        label: Text("New Trip"),
      ),
    );
  }
}
