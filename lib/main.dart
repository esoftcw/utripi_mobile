import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:utripi/screens/add_new_trip_screen.dart';
import 'package:utripi/screens/edit_profile_screen.dart';
import 'package:utripi/screens/edit_trip_screen.dart';
import 'package:utripi/screens/main_screen.dart';
import 'package:utripi/screens/trip_details_screen.dart';
import 'package:utripi/services/auth_service.dart';
import 'package:utripi/services/database_service.dart';
import 'package:utripi/services/trip_service.dart';
import 'firebase_options.dart';
import 'screens/auth_screen.dart';
import 'widgets/auth/reset_password_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AuthService(FirebaseAuth.instance),
      ),
      ChangeNotifierProvider(
        create: (context) => DatabaseService(),
      ),
      Provider<TripBuilderService>(create: (context) => TripBuilderService())
    ],
    child: UTripi(),
  ));
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
        fontFamily: 'Lato',
      ),
      home: const InitApp(),
      routes: {
        AddNewTrip.routeName: (ctx) => AddNewTrip(),
        TripDetailsScreen.routeName: (ctx) => TripDetailsScreen(),
        EditTripScreen.routeName: (ctx) => EditTripScreen(),
        EditProfileScreen.routeName: (ctx) => EditProfileScreen(),
        ResetPasswordFormScreen.routeName: (ctx) => ResetPasswordFormScreen(),
      },
    );
  }
}

class InitApp extends StatelessWidget {
  const InitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (_, authService, __) {
        if (!authService.isLoggedIn) {
          return AuthScreen();
        }

        return MainScreen();
      },
    );
  }
}
