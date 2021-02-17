import 'package:flutter/material.dart';
import 'package:trafic_ui/component/default_button.dart';
import 'package:trafic_ui/screen/dashboard1.dart';

import '../size_config.dart';
import 'otp_screen.dart';
class CompleteScreen extends StatelessWidget {
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
              SizedBox(height: getProportionateScreenWidth(100),),
              Image.asset(
                "assets/images/trafic_light.png",
                height: getProportionateScreenHeight(SizeConfig.screenHeight*0.6),
                width: getProportionateScreenWidth(250),
              ),

              SizedBox(height: getProportionateScreenWidth(20),),


              SizedBox(height: getProportionateScreenWidth(30),),
              DefaultButton(
                text: "Ready TO GO",
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Dashboard1()));
                },
              ),
              SizedBox(height: getProportionateScreenWidth(20),),
            ],
          ),
        ),
      ),
    );
  }
}
