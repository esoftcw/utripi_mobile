import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginCarouselSlider extends StatelessWidget {
  const LoginCarouselSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
              Card(
                elevation: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 50,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/images/svg/sign_in.svg',
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.7,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Text(
                        "Finest Travel Planner in The Market!",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 1,
                child: Container(
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        'assets/images/svg/cell1.svg',
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.7,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.07,
                      ),
                      Text(
                        "Easiest way to plan trip with friends!",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 1,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/svg/fam.svg',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.7,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.07,
                    ),
                    Text(
                      "Plan Less. Travel More!",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 15,
                          fontStyle: FontStyle.italic),
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
