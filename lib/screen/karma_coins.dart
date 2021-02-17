import 'package:flutter/material.dart';

class TotalKarma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffFBFDFF),
            centerTitle: true,
            title: Text(
              'Karma Coins',
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
            leading: IconButton( icon:
              Icon(Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
            onPressed: (){
              Navigator.pop(context);
             },
          ),),
          body: Container(
            height: screenHeight,
            width: screenWidth,
            color: Color(0xffFBFDFF),
            child: Center(
              child: Container(
                height: screenHeight*0.5,
                width: screenWidth*0.9,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Image(image: AssetImage('assets/images/K.png'),fit: BoxFit.fill,height: screenHeight*0.18,),

                        SizedBox(height: screenHeight*0.05,),
                        Text('1k Karma Points',style: TextStyle(fontSize: 18.0,color: Colors.black),),
                      ],
                    ),
                    SizedBox(height: screenHeight*0.08,),
                    Text('We will reveal your',style: TextStyle(fontSize: screenHeight*0.03),),
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                              fontSize: 19.0,
                              color: Color(0xff20252B),
                            ),
                            children: <TextSpan>[

                              TextSpan(
                                  text: ' good karma ',
                                  style: TextStyle(fontSize: screenHeight*0.045)),
                              TextSpan(text: 'soon!',style: TextStyle(fontSize: screenHeight*0.03)),
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
