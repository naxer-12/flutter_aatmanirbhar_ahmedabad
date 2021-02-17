import 'package:flutter/material.dart';
import 'package:trafic_ui/Util/AatmanirbharFlutterTextField.dart';
import 'package:trafic_ui/component/default_button.dart';
import 'package:trafic_ui/profile/complete_screen.dart';

import '../constants.dart';
import '../size_config.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFDFF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenWidth(200),
              ),
              Text(
                "Verify Mobile Number !",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(30),
                  fontWeight: FontWeight.w500,
                  fontFamily: "WorkSans",
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(70),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(60),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey,
                      child: AatmaNirbharFlutterTextField(
                        textInputType: TextInputType.number,
                        hintText: "",
                      ),
                    ),
                  ),
                  SizedBox(
                      width: getProportionateScreenWidth(60),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey,
                        child: AatmaNirbharFlutterTextField(
                          textInputType: TextInputType.number,
                          hintText: "",
                        ),
                      )),
                  SizedBox(
                      width: getProportionateScreenWidth(60),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey,
                        child: AatmaNirbharFlutterTextField(
                          textInputType: TextInputType.number,
                          hintText: "",
                        ),
                      )),
                  SizedBox(
                    width: getProportionateScreenWidth(60),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey,
                      child: AatmaNirbharFlutterTextField(
                        textInputType: TextInputType.number,
                        hintText: "",
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Resend OTP",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(15),
                    fontWeight: FontWeight.w500,
                    color: kResendOtpColor,
                    fontFamily: "WorkSans",
                  ),
                ),
              ),
              DefaultButton(
                text: "Continue",
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CompleteScreen()));
                },
              ),
              SizedBox(
                height: getProportionateScreenWidth(30),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
