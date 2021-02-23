//import 'package:doubanapp/bean/MovieBean.dart';
//import 'package:doubanapp/bean/ComingSoonBean.dart';

import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

//import 'package:palette_generator/palette_generator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:trafic_ui/network/http/http_request.dart';
import 'package:trafic_ui/network/models/CrimeModelData.dart';
import 'package:trafic_ui/network/models/DashboardModel.dart';
import 'package:trafic_ui/network/models/DashboardResponseModel.dart';
import 'package:trafic_ui/network/models/NotificationRequest.dart';
import 'package:trafic_ui/network/models/NotificationResponse.dart';
import 'package:trafic_ui/network/models/NotificationResponse.dart';
import 'package:trafic_ui/network/models/RemoveResponseModel.dart';
import 'package:trafic_ui/network/models/RemoveUserRequestModel.dart';
import 'package:trafic_ui/network/models/ResendOtpRequest.dart';
import 'package:trafic_ui/network/models/ResendOtpResponse.dart';
import 'package:trafic_ui/network/models/UserAuthRequestModel.dart';
import 'package:trafic_ui/network/models/UserRequestModel.dart';
import 'package:trafic_ui/network/models/UserResponse.dart';

typedef RequestCallBack<T> = void Function(T value);

class API {
  static const BASE_URL = 'https://young-reaches-38370.herokuapp.com';

  static const String USER = '/user';
  static const String USER_AUTH = '/userAuth/';
  static const String CRIME = '/crime/';
  static const String RESEND_OTP = '/resendOtp/';
  static const String REMOVE_USER = '/removeUser/';
  static const String DASHBOARD = '/dashboard/';
  static const String NOTIFICATION = '/notification/';

  static const headers = {'Content-Type': 'application/json'};

  Dio dio = Dio();
  var _request = HttpRequest(API.BASE_URL);

  Future<dynamic> _query(String uri, String value) async {
    final result = await _request
        .get('$uri$value?apikey=0b2bdeda43b5688921839c8ecb20399b');
    return result;
  }

  Future<UserResponseModel> getOtp(UserModel otpData) async {
    Map<String, dynamic> data = otpData.toJson();

    final result =
        await _request.post(USER, jsonEncode(data), headers: headers);
    print("response Model:: ${result}");
    UserResponseModel responseModel = UserResponseModel.fromJson(result);
    print("response Model:: ${responseModel.otp}");

    return responseModel;
  }

  void resendOtp(
      RequestCallBack requestCallBack, ResendOtpRequest otpData) async {
    Map<String, dynamic> data = otpData.toJson();
    print("resend OTP:: ${jsonEncode(data)}");

    final result =
        await _request.post(RESEND_OTP, jsonEncode(data), headers: headers);
    print("resend otp result:: ${result}");
    ResendOtpResponse responseModel = ResendOtpResponse.fromJson(result);
    print("resend otp result response:: ${responseModel.otp}");
    requestCallBack(responseModel);
  }

  Future<UserResponseModel> userAuthRequest(UserAuthModel otpData) async {
    Map<String, dynamic> data = otpData.toJson();
    print("user OTP:: ${jsonEncode(data)}");

    final result =
        await _request.post(USER_AUTH, jsonEncode(data), headers: headers);
    print("user otp result:: ${result}");
    UserResponseModel responseModel = UserResponseModel.fromJson(result);
    print("user otp result response:: ${responseModel.userId}");
    // requestCallBack(responseModel);
    return responseModel;
  }

  Future<RemoveAccountResponse> removeUser(RemoveUserModel otpData) async {
    Map<String, dynamic> data = otpData.toJson();
    print("remove USER  ${jsonEncode(data)}");

    final result =
        await _request.post(REMOVE_USER, jsonEncode(data), headers: headers);
    print("remove USER :: ${result}");
    RemoveAccountResponse responseModel =
        RemoveAccountResponse.fromJson(result);
    print("remove USER  response:: ${responseModel.code}");
    return responseModel;
    // requestCallBack(responseModel);
  }

  Future<DashboardResponse> getDashboardData(Dashboard dashboardData) async {
    Map<String, dynamic> data = dashboardData.toJson();
    print("remove USER  ${jsonEncode(data)}");

    final result =
        await _request.post(DASHBOARD, jsonEncode(data), headers: headers);
    print("remove USER :: ${result}");
    DashboardResponse responseModel = DashboardResponse.fromJson(result);
    print("remove USER  response:: ${responseModel.complaint}");
    return responseModel;
    // requestCallBack(responseModel);
  }

  Future<List<NotificationResponse>> getNotificationData(
      NotificationRequest notificationData) async {
    Map<String, dynamic> data = notificationData.toJson();
    print("remove USER  ${jsonEncode(data)}");

    final result =
        await _request.post(NOTIFICATION, jsonEncode(data), headers: headers);
    print("NOTIFICATION USER :: ${result}");
    if (result != null && (result as List).isNotEmpty) {
      List<NotificationResponse> responseModel = (result as List)
          .map((i) => NotificationResponse.fromJson(i))
          .toList();
      print("NOTIFICATION response:: ${responseModel[0]}");
      return responseModel;
    }

    // requestCallBack(responseModel);
  }

  Future<RemoveAccountResponse> addCrimeDetails(CrimeModel crimeModel) async {
    Map<String, dynamic> data = crimeModel.location.toJson();
//    print("remove USER  ${jsonEncode(data)}");

    String imageFile = File(crimeModel.images[0]).path.split('/').last;
    var formData = FormData.fromMap({
      "desc": crimeModel.desc,
      "crime": crimeModel.crime,
      "user_id": crimeModel.userID,
      "vehical_type": crimeModel.vehicleType,
      "number_plate": crimeModel.numberPlate,
      "key": crimeModel.key,
//      "location": "{"lat":1233,"long":3445},
      "images": await MultipartFile.fromFile(File(crimeModel.images[0]).path,
          filename: imageFile
//        contentType:  MediaType("image", "jpg")
          ),
    });
//    for (String data in crimeModel.images) {
//      formData.files.addAll([
//        MapEntry(
//          "images",
//          await MultipartFile.fromFile(data),
//        )
//      ]);
//    }

    print("ADD CRIME DETAILS :: ${formData}");
    Map<String, String> headers = {'Content-Type': 'application/json'};
    dio.options.headers = headers;
    var result;
    try {
      result = await dio.post(
        API.BASE_URL + CRIME,
        data: formData,
      );
    } catch (e) {
      print(e);
    }
    print("RESULT FORM DATA:: ${result}");
//    print("remove USER :: ${result}");
//    RemoveAccountResponse responseModel =
//        RemoveAccountResponse.fromJson(result);
//    print("remove USER  response:: ${responseModel.code}");
//    return responseModel;
    // requestCallBack(responseModel);
  }
}
