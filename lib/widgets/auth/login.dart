import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utripi/services/auth_service.dart';

class LoginForm extends StatefulWidget {
  final void Function(
      String email,
      String password
      ) signInWithEmailAndPassword;
  const LoginForm({Key? key, required this.signInWithEmailAndPassword}) : super(key: key);

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
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.signInWithEmailAndPassword(
                      emailController.text,
                      passwordController.text
                    );
                  }
                },
                child: const Text('Login'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<AuthService>(context, listen: false).registerForm();
                },
                child: const Text('Create account'),
              ),
            ),
          ],
        )
    );
  }

  String? requiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Input cannot be empty';
    }
    return null;
  }

}
