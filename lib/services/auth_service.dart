import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';


class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  bool _isLoggedIn = false;
  User? _user = null;
  AuthForm _authForm = AuthForm.Login;

  AuthService(this._firebaseAuth) {
    listen();
  }

  bool get isLoggedIn => _isLoggedIn;
  User? get user => _user;
  String get userName => _user!.displayName != null ? _user!.displayName! : "";
  String get email => _user!.email!;
  AuthForm get authForm => _authForm;

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
    _authForm = AuthForm.Register;
    notifyListeners();
  }

  void loginForm() {
    _authForm = AuthForm.Login;
    notifyListeners();
  }
  void resetForm() {
    _authForm = AuthForm.Reset;
    notifyListeners();
  }

}

enum AuthForm {
  Login,
  Register,
  Reset
}