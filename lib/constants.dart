import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:trafic_ui/screen/karma_coins.dart';
import 'package:trafic_ui/screen/notifications.dart';
import 'package:trafic_ui/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

const kTextColor = Colors.black;
const kPrimaryColor = Color(0xFFFF7643);
const kSecondaryColor = Color(0xFF979797);
const kAnimationDuration = Duration(milliseconds: 200);
const kFacebookColor = Color(0xFF1878f1);
const kGoogleColor = Color(0xFFF5F5F5);
const kGoogleTextColor = Color(0xFF535353);
const kResendOtpColor = Color(0xFFD6D6D6);

// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";


final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

SnackBar snackBar = SnackBar(
  elevation: 6.0,
  backgroundColor: kPrimaryColor,
  behavior: SnackBarBehavior.floating,
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20))
  ),
  content: Text(
    'Hello',
    style: TextStyle(color: Colors.white),
  ),
);

const defaultDuration = Duration(milliseconds: 250);

_launchURL() async {
  const url = 'https://google.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Drawer myDrawer(screenHeight,screenWidth, context){
  return Drawer(
    child: Container(
      color: Color(0xffFBFDFF),
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: 20.0, vertical: 100.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                const EdgeInsets.only(left: 10.0, bottom: 10.0),
                child: Icon(
                  Icons.account_circle_outlined,
                  size: screenHeight * 0.045,
                ),
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  'Unique Number',
                  style:
                  TextStyle(fontSize: 19.0, letterSpacing: 0.5),
                ),
                subtitle: Row(
                  children: [
                    Text(
                      '3.5',
                      style: TextStyle(
                          fontSize: 19.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Notifications()));
                },
                title: Text(
                  'Notifications',
                  style:
                  TextStyle(fontSize: 19.0, letterSpacing: 0.5),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TotalKarma()));

                },
                title: Text(
                  'Karma Coins',
                  style:
                  TextStyle(fontSize: 19.0, letterSpacing: 0.5),
                ),
              ),
              ListTile(
                onTap: () {
                  Share.share('check out my App',
                      subject: 'Look what I made!');
                },
                title: Text(
                  'Share with friends',
                  style:
                  TextStyle(fontSize: 19.0, letterSpacing: 0.5),
                ),
              ),
              ListTile(
                onTap: () {
                  print('Hello');
                  _launchURL();
                },
                title: Text(
                  'Help',
                  style:
                  TextStyle(fontSize: 19.0, letterSpacing: 0.5),
                ),
              ),
              ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Delete Account'),
                        content: Text(
                            "Are you sure you want to proceed?"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("YES"),
                            onPressed: () {
                              //Put your code here which you want to execute on Yes button click.
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text("NO"),
                            onPressed: () {
                              //Put your code here which you want to execute on No button click.
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                title: Text(
                  'Delete Account',
                  style:
                  TextStyle(fontSize: 19.0, letterSpacing: 0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}