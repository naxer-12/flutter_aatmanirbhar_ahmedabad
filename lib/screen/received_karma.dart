import 'package:flutter/material.dart';
import 'package:trafic_ui/screen/dashboard2.dart';

class KarmaCoins extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight,
      width: screenWidth,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: screenHeight,
            width: screenWidth,
            color: Color(0xffFBFDFF),
            child: Center(
              child: Container(
                height: screenHeight * 0.5,
                width: screenWidth * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'You earned 10 Karma',
                          style: TextStyle(fontSize: 30.0, color: Colors.black),
                        ),
                        Text(
                          'points!',
                          style: TextStyle(fontSize: 30.0, color: Colors.black),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Thanks for being a responsible',
                          style: TextStyle(fontSize: 16.0, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'citizen and reporting!',
                          style: TextStyle(fontSize: 16.0, color: Colors.grey),
                        ),
                      ],
                    ),
                    Image(
                      image: AssetImage('assets/images/Smiley.png'),
                      fit: BoxFit.fill,
                      height: screenHeight * 0.15,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashboard2()));
                      },
                      child: Container(
                        height: 50.0,
                        width: screenWidth * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            border:
                                Border.all(color: Colors.grey, width: 0.43)),
                        child: Center(
                          child: Text(
                            'Back to Home',
                            style:
                                TextStyle(color: Colors.black, fontSize: 19.0),
                          ),
                        ),
                      ),
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
