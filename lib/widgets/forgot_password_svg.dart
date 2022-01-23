import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPasswordSvg extends StatelessWidget {
  const ForgotPasswordSvg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 280,
          width: MediaQuery.of(context).size.width * 0.74,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/svg/password.svg',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.7,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.07,
                    ),
                    Text(
                      "Enter your Email to reset the password!",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
