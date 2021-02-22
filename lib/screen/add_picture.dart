import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trafic_ui/screen/camera_screen.dart';
import 'package:trafic_ui/screen/dashboard2.dart';
import 'package:trafic_ui/screen/received_karma.dart';

class AddPicture extends StatefulWidget {
  @override
  _AddPictureState createState() => _AddPictureState();
}

class _AddPictureState extends State<AddPicture> {
  CameraController cameraController;
  List cameras;
  int selectedCameraIdx = 0;
  List<String> imagePath = List.filled(4, "");
  StreamController<int> streamController = new StreamController<int>();

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: Colors.white,
      child: SafeArea(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          color: Color(0xffFBFDFF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  Container(
                    height: screenHeight * 0.47,
                    width: screenWidth * 0.8,
                  ),
                  Positioned(
                    top: 10.0,
                    child: StreamBuilder<int>(
                        initialData: 0,
                        stream: streamController.stream,
                        builder: (context, snapshot) {
                          return Container(
                            height: screenHeight * 0.41,
                            width: screenWidth * 0.8,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: imagePath.isNotEmpty
                                    ? FileImage(
                                        File(
                                          imagePath[snapshot.data],
                                        ),
                                      )
                                    : FileImage(
                                        File(""),
                                      ),
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                              color: Color(0xffEDF0F2),
                            ),
                          );
                        }),
                  ),
                  Positioned(
                    bottom: 1.0,
                    left: screenWidth * 0.66,
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CameraScreen((value) {
                                setState(
                                  () {
                                    print("VALUE ADDED::${value.length}");
                                    // imagePath.clear();
                                    // print(value + imagePath);
                                    for (int i = 0; i < imagePath.length; i++) {
                                      if (imagePath[i].isEmpty) {
                                        imagePath[i] = value;
                                        break;
                                      }
                                    }
                                    streamController.add(0);
                                    return imagePath;
                                  },
                                );
                              }),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              /*Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: screenHeight * 0.1,
                      width: screenWidth * 0.2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: imagePath.isNotEmpty
                              ? FileImage(
                                  File(
                                    imagePath[0],
                                  ),
                                )
                              : FileImage(
                                  File(""),
                                ),
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color(0xffEDF0F2),
                      ),
                    ),
                    if (imagePath.length == 2)
                      Container(
                        height: screenHeight * 0.1,
                        width: screenWidth * 0.2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imagePath.isNotEmpty
                                ? FileImage(
                                    File(
                                      imagePath[1],
                                    ),
                                  )
                                : FileImage(
                                    File(""),
                                  ),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xffEDF0F2),
                        ),
                      ),
                    if (imagePath.length == 3)
                      Container(
                        height: screenHeight * 0.1,
                        width: screenWidth * 0.2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imagePath.isNotEmpty
                                ? FileImage(
                                    File(
                                      imagePath[2],
                                    ),
                                  )
                                : FileImage(
                                    File(""),
                                  ),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xffEDF0F2),
                        ),
                      ),
                    if (imagePath.length == 4)
                      Container(
                        height: screenHeight * 0.1,
                        width: screenWidth * 0.2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imagePath.isNotEmpty
                                ? FileImage(
                                    File(
                                      imagePath[3],
                                    ),
                                  )
                                : FileImage(
                                    File(""),
                                  ),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xffEDF0F2),
                        ),
                      )
                  ],
                ),
              ),*/
              Container(
                height: screenHeight * 0.1,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  // reverse: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            streamController.add(index);
                          },
                          child: Container(
                            height: screenHeight * 0.1,
                            width: screenWidth * 0.2,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: imagePath[index].isNotEmpty
                                    ? FileImage(
                                        File(
                                          imagePath[index],
                                        ),
                                      )
                                    : FileImage(
                                        File(""),
                                      ),
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                              color: Color(0xffEDF0F2),
                            ),
                          ),
                        ),
                        imagePath[index].isNotEmpty
                            ? Positioned(
                                right: 0.0,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      print("imagepath::${imagePath.length}");
                                      imagePath[index] = "";

                                      for (int i = 0;
                                          i < imagePath.length;
                                          i++) {
                                        if (imagePath[index].isNotEmpty) {
                                          streamController.add(index);
                                          break;
                                        }
                                      }
                                    });
                                  },
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: CircleAvatar(
                                      radius: 14.0,
                                      backgroundColor: Colors.white,
                                      child:
                                          Icon(Icons.close, color: Colors.red),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => KarmaCoins()));
                    },
                    child: Container(
                      height: 40.0,
                      width: 95.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                          child: Text(
                        'Submit',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13.0,
                            decoration: TextDecoration.none),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40.0,
                      width: 95.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.25),
                            spreadRadius: 5,
                            blurRadius: 12,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              fontSize: 13,
                              decoration: TextDecoration.none,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
