import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utripi/models/auth/auth_form_oparation.dart';
import 'package:utripi/services/auth_service.dart';
import 'package:utripi/widgets/auth/login.dart';
import 'package:utripi/widgets/auth/register.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthService>(
        builder: (context, authService, _) {
          return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(50),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                            renderForm(authService)
                        ],
                      ),
                    ),
                  ),
                );
              }
          );
        }
      )
    );
  }

  Widget renderForm(AuthService authService) {
   return authService.authForm.when(
       login: () => LoginForm(signInWithEmailAndPassword: authService.login,),
       register: () => RegisterForm(signUpWithEmailAndPassword: authService.register,),
       reset: () => LoginForm(signInWithEmailAndPassword: authService.login,),
   );
  }
}

