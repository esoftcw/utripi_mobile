import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
            width: double.infinity,
            child: Row(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          // margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: SvgPicture.asset(
                            'assets/images/svg/login.svg',
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            // width: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.height,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [],
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
