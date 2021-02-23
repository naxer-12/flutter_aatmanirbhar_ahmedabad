import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trafic_ui/profile/first_name.dart';

import '../constants.dart';
import '../size_config.dart';

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xFFFBFDFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: getProportionateScreenWidth(50),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40.0),
            child: Image.asset(
              "assets/images/logo.png",
              height: getProportionateScreenHeight(170),
              width: getProportionateScreenWidth(250),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              'Atmanirbhar Ahmedabad',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
                fontFamily: "WorkSans",
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(60),
          ),
          /*Container(
            margin: EdgeInsets.symmetric(horizontal: 40.0),
            child: loginButton(
                context,
                kFacebookColor,
                'assets/images/facebook.svg',
                Colors.white,
                Colors.white,
                "Continue with Facebook", () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => FirstName()));
            }),
          ),
          SizedBox(
            height: getProportionateScreenWidth(18),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40.0),
            child: loginButton(
              context,
              kGoogleColor,
              'assets/images/google.svg',
              kGoogleTextColor,
              kGoogleTextColor,
              "Continue with Google",
              () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FirstName()));
              },
            ),
          ),*/
          SizedBox(
            height: getProportionateScreenWidth(15),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FirstName()));
            },
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Use mobile number',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Color(0xFF1C1D1F),
                  fontFamily: "WorkSans",
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(200),
          ),
          Text(
            'By Signing You agree to the terms and conditions.',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: Color(0xFF1C1D1F),
              fontFamily: "WorkSans",
            ),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                onPressed: () {},
                child: Text(
                  'Terms of Service',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                    color: Color(0xFF1C1D1F),
                    letterSpacing: -1.0,
                    fontFamily: "WorkSans",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                    color: Color(0xFF1C1D1F),
                    letterSpacing: -1.0,
                    fontFamily: "WorkSans",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  InkWell loginButton(BuildContext context, Color bgColor, String assetPath,
      Color svgColor, Color textColor, String buttonText, Function onPress) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40.0,
        decoration: ShapeDecoration(
          color: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: SizedBox(
                child: SvgPicture.asset(
                  assetPath,
                  color: svgColor,
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              buttonText,
              style: TextStyle(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
