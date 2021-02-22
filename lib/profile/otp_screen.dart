import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trafic_ui/Util/AatmanirbharFlutterTextField.dart';
import 'package:trafic_ui/component/default_button.dart';
import 'package:trafic_ui/network/http/API.dart';
import 'package:trafic_ui/network/models/ResendOtpRequest.dart';
import 'package:trafic_ui/network/models/ResendOtpResponse.dart';
import 'package:trafic_ui/network/models/UserAuthRequestModel.dart';
import 'package:trafic_ui/network/models/UserRequestModel.dart';
import 'package:trafic_ui/network/models/UserResponse.dart';
import 'package:trafic_ui/profile/complete_screen.dart';
import 'package:trafic_ui/util/pin_view.dart';
import 'package:trafic_ui/util/shared_pref_constant.dart';
import 'package:trafic_ui/util/shared_preference_util.dart';

import '../constants.dart';
import '../size_config.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool showLoading = true;
  final API _api = API();
  int localUserID;
  int remoteLocalUserID;

  @override
  void initState() {
    fetchOtp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFDFF),
      body: !showLoading
          ? SingleChildScrollView(
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
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
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
                        submit: (String pin) async {
                          // when all the fields are filled
                          // submit function runs with the pin
                          UserModel userModel = getUserModel();
                          // _api.getOtp((value) {
                          //   print(value);
                          // }, userModel);
                          print("OTP::" + pin);
                        }),
                    SizedBox(
                      height: 20.0,
                    ),
                    InkWell(
                      onTap: () async {
                        // setState(() {
                        //   showLoading = false;
                        // });
                        ResendOtpRequest resendOtp =
                            await getResendOtpRequestModel();
                        _api.resendOtp((value) async {
                          // print("resend OTP::" +
                          //     (value as ResendOtpResponse)?.otp.toString());
                          await MySharedPreferences.instance.setIntegerValue(
                              USER_OTP, (value as ResendOtpResponse)?.otp);
                          Fluttertoast.showToast(
                              msg: (value as ResendOtpResponse)?.otp.toString(),
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                              fontSize: 10.0);
                        }, resendOtp);
                      },
                      child: Align(
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
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(30),
                    ),
                    DefaultButton(
                      text: "Continue",
                      press: () async {
                        UserAuthModel userAuthModel = await getUserAuthModel();
                        localUserID = await MySharedPreferences.instance
                            .getIntegerValue(USER_ID);
                        Future(() => (_api.userAuthRequest(userAuthModel)))
                            .then((value) {
                          remoteLocalUserID =
                              (value as UserResponseModel).userId;
                          if (remoteLocalUserID == localUserID) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CompleteScreen(),
                              ),
                            );
                          }
                        });
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
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  UserModel getUserModel() {
    UserModel userModel;
    MySharedPreferences.instance.getStringValue(USER_FIRST_NAME).then(
        (value) => {print(userModel.firstname), userModel.firstname = value});
    MySharedPreferences.instance.getStringValue(USER_LAST_NAME).then(
        (value) => {print(userModel.lastname), userModel.lastname = value});
    MySharedPreferences.instance.getIntegerValue(USER_MOBILE_NO).then(
        (value) => {print(userModel.mobileno), userModel.mobileno = value});
    return userModel;
  }

  Future<void> fetchOtp() async {
    int otpData = await MySharedPreferences.instance.getIntegerValue(USER_OTP);

    if (otpData != null) {
      setState(() {
        showLoading = false;
        Fluttertoast.showToast(
            msg: otpData.toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 10.0);
      });
    }
  }

  Future<ResendOtpRequest> getResendOtpRequestModel() async {
    int userId = await MySharedPreferences.instance.getIntegerValue(USER_ID);

    // .then((value) => {print("FIRSTNAME::${value}")});
    int key = await MySharedPreferences.instance.getIntegerValue(USER_KEY);

    ResendOtpRequest resendModel = ResendOtpRequest(key: key, userId: userId);
    return resendModel;
  }

  Future<UserAuthModel> getUserAuthModel() async {
    // .then((value) => {print("FIRSTNAME::${value}")});
    int key = await MySharedPreferences.instance.getIntegerValue(USER_KEY);
    int otp = await MySharedPreferences.instance.getIntegerValue(USER_OTP);
    int mobileNo =
        await MySharedPreferences.instance.getIntegerValue(USER_MOBILE_NO);
    UserAuthModel userAuthModel =
        UserAuthModel(key: key, mobileno: mobileNo, otp: otp);
    return userAuthModel;
  }
}
