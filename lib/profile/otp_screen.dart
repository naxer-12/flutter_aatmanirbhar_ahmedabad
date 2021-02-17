import 'package:flutter/material.dart';
import 'package:trafic_ui/component/default_button.dart';
import 'package:trafic_ui/profile/complete_screen.dart';

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
              SizedBox(height: getProportionateScreenWidth(200),),

              Text("Verify Mobile Number", style: TextStyle(fontSize: getProportionateScreenWidth(40), fontWeight: FontWeight.w600, fontFamily: "WorkSans"),),
              SizedBox(height: getProportionateScreenWidth(20),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(60),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "",
                        floatingLabelBehavior: FloatingLabelBehavior.always,

                      ),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(60),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "",
                        floatingLabelBehavior: FloatingLabelBehavior.always,

                      ),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(60),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "",
                        floatingLabelBehavior: FloatingLabelBehavior.always,

                      ),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(60),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "",
                        floatingLabelBehavior: FloatingLabelBehavior.always,

                      ),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: getProportionateScreenWidth(30),),
              DefaultButton(
                text: "Continue",
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CompleteScreen()));

                },
              ),
              SizedBox(height: getProportionateScreenWidth(20),),
              Text("This won't be shown on your profile.", style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }
}
