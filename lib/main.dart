import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:utripi/screens/add_new_trip_screen.dart';
import 'package:utripi/screens/edit_profile_screen.dart';
import 'package:utripi/screens/edit_trip_screen.dart';
import 'package:utripi/screens/main_screen.dart';
import 'package:utripi/screens/trip_details_screen.dart';
import 'package:utripi/services/auth_service.dart';
import 'firebase_options.dart';
import 'dart:developer';


import 'constant/colors.dart';
import 'screens/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      ChangeNotifierProvider(
        create: (context) => AuthService(FirebaseAuth.instance),
        builder: (context, _) => UTripi(),
      ),
  );
}

class UTripi extends StatelessWidget {
  const UTripi({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InitApp(),
      routes: {
        AddNewTrip.routeName: (ctx) => AddNewTrip(),
        TripDetailsScreen.routeName: (ctx) => TripDetailsScreen(),
        EditTripScreen.routeName: (ctx) => EditTripScreen(),
        EditProfileScreen.routeName: (ctx) => EditProfileScreen(),
      },
    );
  }
}

class InitApp extends StatelessWidget {
  const InitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (_, authService, __ ) {
        if (!authService.isLoggedIn) {
          return AuthScreen();
        }

        return MainScreen();
      },
    );
  }


}


