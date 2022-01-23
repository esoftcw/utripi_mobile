import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:utripi/widgets/login_carousel_slider.dart';

import '../forgot_password_svg.dart';

class ResetPasswordFormScreen extends StatefulWidget {
  static const routeName = '/resetp';

  const ResetPasswordFormScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordFormScreenState createState() =>
      _ResetPasswordFormScreenState();
}

class _ResetPasswordFormScreenState extends State<ResetPasswordFormScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ForgotPasswordSvg(),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(label: Text("Email")),
                    // controller: emailController,
                    // validator: requiredValidator,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text('Reset Password'),
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
          ),
        ),
      )),
    );
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Email';
    }
    return null;
  }
}
