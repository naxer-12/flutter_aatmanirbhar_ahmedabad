import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trafic_ui/Util/AatmanirbharFlutterTextField.dart';
import 'package:trafic_ui/component/default_button.dart';
import 'package:trafic_ui/network/http/API.dart';
import 'package:trafic_ui/network/models/UserRequestModel.dart';
import 'package:trafic_ui/network/models/UserResponse.dart';
import 'package:trafic_ui/profile/last_name.dart';
import 'package:trafic_ui/size_config.dart';
import 'package:trafic_ui/util/shared_pref_constant.dart';
import 'package:trafic_ui/util/shared_preference_util.dart';

import 'otp_screen.dart';

class ContactNumber extends StatefulWidget {
  @override
  _ContactNumberState createState() => _ContactNumberState();
}

class _ContactNumberState extends State<ContactNumber> {
  final TextEditingController contactNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final API _api = API();

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
                "Please add your contact.",
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
                  textInputType: TextInputType.number,
                  hintText: "Add your number",
                  editTextController: contactNumber,
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(30),
              ),
              DefaultButton(
                text: "Continue",
                press: () async {
                  MySharedPreferences.instance.setIntegerValue(
                      USER_MOBILE_NO, int.parse(contactNumber.text));
                  UserModel userModel = await getUserModel();

                  Future(() => (_api.getOtp(userModel))).then((value) {
                    MySharedPreferences.instance.setIntegerValue(
                        USER_ID, (value as UserResponseModel)?.userId);
                    MySharedPreferences.instance.setIntegerValue(
                        USER_KEY, (value as UserResponseModel)?.key);
                    MySharedPreferences.instance.setIntegerValue(
                        USER_OTP, (value as UserResponseModel)?.otp);
                    print("VALUE CONTACT NUBER:: ${value}");
                    if (value != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(),
                        ),
                      );
                    }
                  });
                  // _api.getOtp((value) async {
                  //   // print(value);
                  // }, userModel);
                  // print("OTP::" + pin);

                  // print("FIRSTNAME::${contactNumber.text}");
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

  Future<UserModel> getUserModel() async {
    // UserModel userModel;
    String firstName =
        await MySharedPreferences.instance.getStringValue(USER_FIRST_NAME);

    // .then((value) => {print("FIRSTNAME::${value}")});
    String lastName =
        await MySharedPreferences.instance.getStringValue(USER_LAST_NAME);
    int mobileNo =
        await MySharedPreferences.instance.getIntegerValue(USER_MOBILE_NO);
    UserModel userModel =
        UserModel(firstname: firstName, lastname: lastName, mobileno: mobileNo);
    return userModel;
  }
}
