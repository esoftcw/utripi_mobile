import 'package:flutter/material.dart';

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
              controller: emailController,
              validator: requiredValidator,
            ),
            TextFormField(
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('s')),
                    );
                  }
                },
                child: const Text('Login'),
              ),
            )
          ],
        )
    );
  }

  String? requiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

}
