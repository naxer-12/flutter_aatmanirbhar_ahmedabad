import 'package:flutter/material.dart';
import 'package:trafic_ui/Util/AatmanirbharFlutterTextField.dart';
import 'package:trafic_ui/component/default_button.dart';
import 'package:trafic_ui/profile/complete_screen.dart';
import 'package:trafic_ui/util/pin_view.dart';

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
              /*  Row(
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
              ),*/

              PinView(
                  count: 4,
                  // describes the field number
                  autoFocusFirstField: false,
                  // defaults to true
                  margin: EdgeInsets.all(2.5),
                  // margin between the fields
                  style: TextStyle(
                      // style for the fields
                      fontSize: 19.0,
                      fontWeight: FontWeight.w500),
                  inputDecoration: InputDecoration(
                    hintText: "",
                    hintStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  submit: (String pin) {
                    // when all the fields are filled
                    // submit function runs with the pin
                    print(pin);
                  }),
              SizedBox(
                height: 20.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Resend OTP",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(15),
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1C1D1F),
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
