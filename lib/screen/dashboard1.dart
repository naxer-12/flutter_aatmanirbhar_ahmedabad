import 'package:flutter/material.dart';
import 'package:trafic_ui/screen/add_picture.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';

class Dashboard1 extends StatefulWidget {
  @override
  _Dashboard1State createState() => _Dashboard1State();
}

class _Dashboard1State extends State<Dashboard1> {
  Future<void> _launched;

  // _launchURL() async {
  //   const url = 'https://google.com';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  // Future<void> _launchInBrowser() async {
  //   var url = 'https://www.google.com';
  //   if (await canLaunch(url)) {
  //     await launch(
  //       url,
  //       forceSafariVC: false,
  //       forceWebView: false,
  //       headers: <String, String>{'my_header_key': 'my_header_value'},
  //     );
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  //  _launchURL() async {
  //   const url = 'https://www.google.com';
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight,
            width: screenWidth,
            color: Colors.white,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xffFBFDFF),
                leading: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    top: 10.0,
                  ),
                  child: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Color(0xff20252B),
                        ),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      );
                    },
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      top: 10.0,
                    ),
                    child: IconButton(
                        icon: Icon(
                          Icons.notifications_none,
                          color: Color(0xff20252B),
                        ),
                        onPressed: null),
                  )
                ],
              ),
              drawer: myDrawer(screenHeight, screenWidth, context),
              body: Container(
                height: screenHeight,
                width: screenWidth,
                color: Color(0xffFBFDFF),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      'Report',
                      style: TextStyle(fontSize: 40.0, letterSpacing: 1.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                              fontSize: 19.0,
                              color: Color(0xff20252B),
                            ),
                            children: <TextSpan>[
                          TextSpan(text: 'the'),
                          TextSpan(
                              text: ' first violation ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: 'you see!'),
                        ])),
                    SizedBox(
                      height: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 30.0),
                      child: Container(
                        child: Image(
                          fit: BoxFit.fill,
                          image:
                              AssetImage('assets/images/dasboard1_image.png'),
                        ),
                      ),
                    ),
                    Text('Be a responsible citizen and',
                        style: TextStyle(fontSize: 19.0)),
                    Text('earn your karma points.',
                        style: TextStyle(fontSize: 19.0)),
                    SizedBox(
                      height: 50.0,
                    ),
                    Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.25),
                            spreadRadius: 5,
                            blurRadius: 12,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddPicture()));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                              fontSize: 19.0,
                              color: Color(0xff20252B),
                            ),
                            children: <TextSpan>[
                          TextSpan(text: 'Powered By'),
                          TextSpan(
                              text: ' Karma Points ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ])),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
