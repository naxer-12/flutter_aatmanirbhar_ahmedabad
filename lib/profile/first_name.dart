import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trafic_ui/Util/AatmanirbharFlutterTextField.dart';
import 'package:trafic_ui/component/default_button.dart';
import 'package:trafic_ui/profile/last_name.dart';
import 'package:trafic_ui/size_config.dart';
import 'package:trafic_ui/util/shared_pref_constant.dart';
import 'package:trafic_ui/util/shared_preference_util.dart';

class FirstName extends StatefulWidget {
  @override
  _FirstNameState createState() => _FirstNameState();
}

class _FirstNameState extends State<FirstName> {
  final TextEditingController firstNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFDFF),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenWidth(200),
              ),
              Text(
                "What's your first name ?",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(30),
                  fontWeight: FontWeight.w500,
                  fontFamily: "WorkSans",
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              Text(
                "You won't be able to change this later.",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(12),
                  fontWeight: FontWeight.w500,
                  fontFamily: "WorkSans",
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey,
                child: AatmaNirbharFlutterTextField(
                  textInputType: TextInputType.emailAddress,
                  hintText: "Add your first name",
                  editTextController: firstNameController,
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(30),
              ),
              DefaultButton(
                text: "Continue",
                press: () {
                  print("FIRSTNAME::${firstNameController.text}");
                  MySharedPreferences.instance.setStringValue(
                      USER_FIRST_NAME, firstNameController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LastName(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 7,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: SvgPicture.asset(
                      'assets/images/eye-slash.svg',
                      height: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "This won't be shown on your profile.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
