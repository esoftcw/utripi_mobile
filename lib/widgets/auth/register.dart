import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utripi/services/auth_service.dart';
import 'package:utripi/util/validators/email_validator.dart';
import 'package:utripi/util/validators/required_validator.dart';

class RegisterForm extends StatefulWidget {

  final void Function(
      String name,
      String email,
      String password
      ) signUpWithEmailAndPassword;

  const RegisterForm({Key? key, required this.signUpWithEmailAndPassword}) : super(key: key);

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

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.signUpWithEmailAndPassword(
                        nameController.text,
                        emailController.text,
                        passwordController.text
                    );
                  }
                },
                child: const Text('Create account'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<AuthService>(context, listen: false).loginForm();
                },
                child: const Text('Already have account?'),
              ),
            ),
          ],
        )
    );
  }



}
