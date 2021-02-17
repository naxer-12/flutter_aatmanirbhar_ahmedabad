import 'package:flutter/material.dart';
import 'package:trafic_ui/component/default_button.dart';
import 'package:trafic_ui/profile/last_name.dart';
import 'package:trafic_ui/size_config.dart';
class FirstName extends StatefulWidget {
  @override
  _FirstNameState createState() => _FirstNameState();
}

class _FirstNameState extends State<FirstName> {
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

              Text("Whats your first name", style: TextStyle(fontSize: getProportionateScreenWidth(40), fontWeight: FontWeight.w600, fontFamily: "WorkSans"),),
              SizedBox(height: getProportionateScreenWidth(20),),
              Text("You won't be able to change this later."),
              SizedBox(height: getProportionateScreenWidth(20),),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Add your First Name",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(30),),
              DefaultButton(
                text: "Continue",
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> LastName()));

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
