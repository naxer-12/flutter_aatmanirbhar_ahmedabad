import 'package:flutter/material.dart';
import 'package:trafic_ui/component/default_button.dart';
import 'package:trafic_ui/profile/otp_screen.dart';

import '../size_config.dart';
import 'last_name.dart';
class ContactNumber extends StatefulWidget {
  @override
  _ContactNumberState createState() => _ContactNumberState();
}

class _ContactNumberState extends State<ContactNumber> {
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

              Text("Please Add Contact", style: TextStyle(fontSize: getProportionateScreenWidth(40), fontWeight: FontWeight.w600, fontFamily: "WorkSans"),),
              SizedBox(height: getProportionateScreenWidth(20),),
              Text("You can change number latter as well."),
              SizedBox(height: getProportionateScreenWidth(20),),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Add your number",
                  floatingLabelBehavior: FloatingLabelBehavior.always,

                ),
              ),
              SizedBox(height: getProportionateScreenWidth(30),),
              DefaultButton(
                text: "Continue",
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> OtpScreen()));

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
