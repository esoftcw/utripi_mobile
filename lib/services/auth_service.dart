import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:utripi/models/auth/auth_request.dart';

import 'dart:developer';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  bool _isLoggedIn = false;
  User? _user = null;

  AuthService(this._firebaseAuth) {
    listen();
  }

  bool get isLoggedIn => _isLoggedIn;
  User? get user => _user;

  Future<void> listen() async {
    _firebaseAuth.userChanges().listen((user) {
      if (user != null) {
        _isLoggedIn = true;
      } else  {
        _isLoggedIn = false;
      }
      notifyListeners();
    });
  }

  Future<UserCredential> login(String email, String password) async {
      return _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> register(AuthRequest request) async {
    return _firebaseAuth.createUserWithEmailAndPassword(email: request.email, password: request.password!);
  }

  void logout() {
    FirebaseAuth.instance.signOut();
  }

}