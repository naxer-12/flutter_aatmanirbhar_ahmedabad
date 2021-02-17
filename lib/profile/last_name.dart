import 'package:flutter/material.dart';
import 'package:trafic_ui/component/default_button.dart';
import 'package:trafic_ui/profile/contact_number.dart';

import '../size_config.dart';

class LastName extends StatefulWidget {
  @override
  _LastNameState createState() => _LastNameState();
}

class _LastNameState extends State<LastName> {
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

              Text("What's your last name", style: TextStyle(fontSize: getProportionateScreenWidth(40), fontWeight: FontWeight.w600, fontFamily: "WorkSans"), ),
              SizedBox(height: getProportionateScreenWidth(20),),
              Text("You won't be able to change this later."),
              SizedBox(height: getProportionateScreenWidth(20),),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Add your Last Name",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(30),),
              DefaultButton(
                text: "Continue",
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ContactNumber()));

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
