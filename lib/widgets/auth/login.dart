import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utripi/services/auth_service.dart';

import '../login_carousel_slider.dart';

class LoginForm extends StatefulWidget {
  final void Function(String email, String password) signInWithEmailAndPassword;
  const LoginForm({Key? key, required this.signInWithEmailAndPassword})
      : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Text(
                    'UTripi',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                      color: Colors.blue[500],
                    ),
                  ),
                ],
              ),
            ),
            LoginCarouselSlider(),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(label: Text("Email")),
                  controller: emailController,
                  validator: requiredValidator,
                ),
                TextFormField(
                  decoration: InputDecoration(label: Text("Password")),
                  controller: passwordController,
                  validator: requiredValidator,
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            widget.signInWithEmailAndPassword(
                                emailController.text, passwordController.text);
                          }
                        },
                        child: const Text('Login'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Provider.of<AuthService>(context, listen: false)
                              .registerForm();
                        },
                        child: const Text('Create account'),
                        style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  String? requiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Input cannot be empty';
    }
    return null;
  }
}
