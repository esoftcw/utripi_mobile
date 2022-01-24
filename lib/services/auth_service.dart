import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:utripi/models/auth/auth_form_oparation.dart';


class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  bool _isLoggedIn = false;
  User? _user = null;
  AuthFormOperation _authForm = AuthFormOperation.login();

  AuthService(this._firebaseAuth) {
    listen();
  }

  bool get isLoggedIn => _isLoggedIn;
  User? get user => _user;
  String get userName => _user!.displayName != null ? _user!.displayName! : "";
  String get email => _user!.email!;
  AuthFormOperation get authForm => _authForm;

  Future<void> listen() async {
    _firebaseAuth.userChanges().listen((user) {
      if (user != null) {
        _isLoggedIn = true;
        _user = user;
      } else  {
        _isLoggedIn = false;
        _user = null;
      }
      notifyListeners();
    });
  }

  Future<UserCredential> login(String email, String password) async {
      return _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> register(String name, String email, String password) async {
    var credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    await credential.user!.updateDisplayName(name);
    return credential;
  }

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  void registerForm() {
    _authForm = AuthFormOperation.register();
    notifyListeners();
  }

  void loginForm() {
    _authForm = AuthFormOperation.login();
    notifyListeners();
  }
  void resetForm() {
    _authForm = AuthFormOperation.reset();
    notifyListeners();
  }

}

enum AuthForm {
  Login,
  Register,
  Reset
}