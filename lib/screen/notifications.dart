import 'package:flutter/material.dart';
import 'package:trafic_ui/network/http/API.dart';
import 'package:trafic_ui/network/models/NotificationRequest.dart';
import 'package:trafic_ui/network/models/NotificationResponse.dart';
import 'package:trafic_ui/util/shared_pref_constant.dart';
import 'package:trafic_ui/util/shared_preference_util.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool showLoading = true;
  List<NotificationResponse> notificationList = List();
  String desc = "";
  final API _api = API();

  @override
  void initState() {
    fetchNotificationApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return !showLoading
        ? Container(
            height: screenHeight,
            width: screenWidth,
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Color(0xffFBFDFF),
                  centerTitle: true,
                  title: Text(
                    'Notifications',
                    style: TextStyle(fontSize: 18.0, color: Colors.black),
                  ),
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                body: SingleChildScrollView(
                  child: Container(
                    height: screenHeight,
                    width: screenWidth,
                    color: Color(0xffFBFDFF),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: screenWidth * 0.04,
                                    top: screenHeight * 0.02,
                                    bottom: screenHeight * 0.02),
                                child: Text(
                                  'TODAY',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      letterSpacing: 0.2,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: screenHeight * 0.18,
                            width: screenWidth * 0.95,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(screenWidth * 0.005),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueGrey.withOpacity(0.25),
                                  spreadRadius: 1,
                                  blurRadius: 20,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: screenWidth * 0.05,
                                      right: screenWidth * 0.03,
                                      bottom: screenHeight * 0.04),
                                  child: Container(
                                    height: screenHeight * 0.012,
                                    width: screenWidth * 0.025,
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(
                                          screenHeight * 0.01),
                                    ),
                                  ),
                                ),
                                if (notificationList != null &&
                                    notificationList.isNotEmpty)
                                  ...notificationList.map(
                                    (e) => Padding(
                                      padding: EdgeInsets.only(
                                          left: screenWidth * 0.01,
                                          top: screenHeight * 0.02),
                                      child: Container(
                                        width: screenWidth * 0.7,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e.notificationDescription,
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                height: 1.5,
                                              ),
                                            ),
                                            SizedBox(
                                              height: screenHeight * 0.01,
                                            ),
                                            Text(
                                              '01:30 PM',
                                              style: TextStyle(
                                                  color: Colors.grey[300],
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                if (notificationList.isEmpty)
                                  Text("N Data is available")
                              ],
                            ),
                          ),

//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      children: [
//                        Padding(
//                          padding:  EdgeInsets.only(left:screenWidth*0.04,top: screenHeight*0.04,bottom: screenHeight*0.02),
//                          child: Text('YESTERDAY',style: TextStyle(color: Colors.black,fontSize: 18.0,letterSpacing: 0.2,fontWeight: FontWeight.bold),),
//                        ),
//                      ],
//                    ),
//                    Container(
//                      height: screenHeight*0.15,
//                      width: screenWidth*0.95,
//                      decoration: BoxDecoration(
//                        color: Colors.white,
//                        borderRadius: BorderRadius.circular(screenWidth*0.005),
//                        boxShadow: [
//                          BoxShadow(
//                            color: Colors.blueGrey.withOpacity(0.25),
//                            spreadRadius: 1,
//                            blurRadius: 12,
//                            offset: Offset(0, 3), // changes position of shadow
//                          ),
//                        ],
//                      ),
//                      child: Row(
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: [
//                          Padding(
//                            padding: EdgeInsets.only(left:screenWidth*0.05,right: screenWidth*0.03  ,bottom: screenHeight*0.04),
//                            child: Container(
//                              height : screenHeight*0.012,
//                              width: screenWidth*0.025,
//                              decoration: BoxDecoration(
//                                color: Colors.cyan,
//                                borderRadius: BorderRadius.circular(screenHeight*0.01),
//                              ),
//                            ),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.only(left: screenWidth*0.01,top:screenHeight*0.02),
//                            child: Container(
//                              width: screenWidth*0.7,
//                              child: Column(
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: [
//                                  Text('Your Report got approved and 200 KC credited to your account',style: TextStyle(fontSize: 18.0,height:1.5,),),
//                                  SizedBox(height: screenHeight*0.01,),
//                                  Text('01:30 PM',style: TextStyle(color: Colors.grey[300],fontSize: 12.0,fontWeight: FontWeight.bold),)
//                                ],
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                    Padding(
//                      padding: EdgeInsets.only(top:screenHeight*0.02),
//                      child: Container(
//                        height: screenHeight*0.15,
//                        width: screenWidth*0.95,
//                        decoration: BoxDecoration(
//                          color: Colors.white,
//                          borderRadius: BorderRadius.circular(screenWidth*0.005),
//                          boxShadow: [
//                            BoxShadow(
//                              color: Colors.blueGrey.withOpacity(0.25),
//                              spreadRadius: 1,
//                              blurRadius: 12,
//                              offset: Offset(0, 3), // changes position of shadow
//                            ),
//                          ],
//                        ),
//                        child: Row(
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          children: [
//                            Padding(
//                              padding: EdgeInsets.only(left:screenWidth*0.05,right: screenWidth*0.03  ,bottom: screenHeight*0.04),
//                              child: Container(
//                                height : screenHeight*0.012,
//                                width: screenWidth*0.025,
//                                decoration: BoxDecoration(
//                                  color: Colors.green,
//                                  borderRadius: BorderRadius.circular(screenHeight*0.01),
//                                ),
//                              ),
//                            ),
//                            Padding(
//                              padding: EdgeInsets.only(left: screenWidth*0.01,top:screenHeight*0.02),
//                              child: Container(
//                                width: screenWidth*0.7,
//                                child: Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: [
//                                    Text('Your Report got approved and 200 KC credited to your account',style: TextStyle(fontSize: 18.0,height:1.5,),),
//                                    SizedBox(height: screenHeight*0.01,),
//                                    Text('01:30 PM',style: TextStyle(color: Colors.grey[300],fontSize: 12.0,fontWeight: FontWeight.bold),)
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                    ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
            color: Colors.white,
          );
  }

  Future<void> fetchNotificationApi() async {
    int userId = await MySharedPreferences.instance.getIntegerValue(USER_ID);

    // .then((value) => {print("FIRSTNAME::${value}")});
    int key = await MySharedPreferences.instance.getIntegerValue(USER_KEY);

    NotificationRequest notificationRequest =
        NotificationRequest(key: key, notificationSenderId: userId);

    Future(() => (_api.getNotificationData(notificationRequest))).then((value) {
      print("VALUE DASHBOARD:: ${value}");
      if (value != null) {
        setState(() {
          showLoading = false;
          notificationList.clear();
          notificationList.addAll(value);
        });
      }
    });
    return notificationRequest;
  }
}
