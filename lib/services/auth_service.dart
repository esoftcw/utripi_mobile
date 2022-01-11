import 'package:firebase_auth/firebase_auth.dart';
import 'package:utripi/models/auth/auth_request.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  AuthService(this._firebaseAuth);

  Future<UserCredential> login(AuthRequest request) async {
      return _firebaseAuth.signInWithEmailAndPassword(email: request.email, password: request.password!);
  }

  Future<UserCredential> register(AuthRequest request) async {
    return _firebaseAuth.createUserWithEmailAndPassword(email: request.email, password: request.password!);
  }
}