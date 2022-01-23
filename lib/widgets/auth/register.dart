import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utripi/services/auth_service.dart';
import 'package:utripi/util/validators/email_validator.dart';
import 'package:utripi/util/validators/required_validator.dart';

import '../login_carousel_slider_signup.dart';

class RegisterForm extends StatefulWidget {
  final void Function(String name, String email, String password)
      signUpWithEmailAndPassword;

  const RegisterForm({Key? key, required this.signUpWithEmailAndPassword})
      : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
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
            LoginCarouselSliderSignUp(),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(label: Text("Name")),
                  controller: nameController,
                  validator: emailValidator,
                ),
                TextFormField(
                  decoration: InputDecoration(label: Text("Email")),
                  controller: emailController,
                  validator: emailValidator,
                ),
                TextFormField(
                  decoration: InputDecoration(label: Text("Password")),
                  controller: passwordController,
                  validator: requiredValidator,
                  obscureText: true,
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.signUpWithEmailAndPassword(nameController.text,
                          emailController.text, passwordController.text);
                    }
                  },
                  child: const Text('Sign Up'),
                ),
                OutlinedButton(
                  onPressed: () {
                    Provider.of<AuthService>(context, listen: false)
                        .loginForm();
                  },
                  child: const Text('Already have account?'),
                ),
              ],
            ),
          ],
        ));
  }
}
