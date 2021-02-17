import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../constants.dart';

class Dashboard2 extends StatefulWidget {
  @override
  _Dashboard2State createState() => _Dashboard2State();
}

class _Dashboard2State extends State<Dashboard2> {
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('250 Violations',style: TextStyle(fontSize: 27.0,),),
                    CircularPercentIndicator(
                      radius: screenHeight*0.29,
                      lineWidth: 28.0,
                      percent: 0.5,
                      center: Padding(
                        padding: const EdgeInsets.only(top:75.0),
                        child: Column(
                          children: [
                            Text("50%",style: TextStyle(fontSize: 35.0,fontWeight: FontWeight.bold,color: Color(0xff25C1AB)),),
                            Text("Resolved",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Color(0xff25C1AB)),),
                          ],
                        ),
                      ),
                      progressColor: Color(0xff25C1AB),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right:screenWidth*0.1),
                        child: Container(
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
                          child:
                          Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),

                    ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 50.0,
                          width: screenWidth*0.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              border: Border.all(color: Colors.grey,width: 0.43)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Complain Status',style: TextStyle(fontSize: 19.0),),
                              Row(
                                children: [
                                  Text('22/50',style: TextStyle(fontSize: 19.0),),
                                  Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,),
                                ],
                              )
                            ],
                          ),
                         ),
                        SizedBox(height: 20.0,),
                        Container(
                          height: 50.0,
                          width: screenWidth*0.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              border: Border.all(color: Colors.grey,width: 0.43)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('karma Coins Earned',style: TextStyle(fontSize: 19.0),),
                              Row(
                                children: [
                                  Text('333',style: TextStyle(fontSize: 19.0),),
                                  Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,),
                                ],
                              )
                            ],
                          ),
                        )

                      ],
                    ),


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
