import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:quick_eats_delivery/data/datasource/remote/dio/dio_client.dart';
import 'package:quick_eats_delivery/data/datasource/remote/exception/api_error_handler.dart';
import 'package:quick_eats_delivery/features/auth/domain/models/delivery_man_model.dart';
import 'package:quick_eats_delivery/common/models/api_response_model.dart';
import 'package:quick_eats_delivery/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;
  
  AuthRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponseModel> login({String? emailAddress, String? password}) async {
    try {
      Response response = await dioClient!.post(
        AppConstants.loginUri,
        data: {"email": emailAddress, "password": password},
      );
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // for user token
  Future<void> saveUserToken(String token) async {
    dioClient?.token = token;
    dioClient?.dio?.options.headers = {'Content-Type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'};

    try {
      await sharedPreferences!.setString(AppConstants.token, token);
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponseModel> updateToken() async {
    try {
      String? deviceToken;
      if (!Platform.isAndroid) {
        NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
          alert: true, announcement: false, badge: true, carPlay: false,
          criticalAlert: false, provisional: false, sound: true,
        );
        if(settings.authorizationStatus == AuthorizationStatus.authorized) {
          deviceToken = await _saveDeviceToken();
        }
      } else {
        deviceToken = await _saveDeviceToken();
      }

      if (!kIsWeb) {
        FirebaseMessaging.instance.subscribeToTopic(AppConstants.topic);
      }

      Response response = await dioClient!.post(
        AppConstants.tokenUri,
        data: {"_method": "put", "fcm_token": deviceToken, "token": sharedPreferences!.get(AppConstants.token)},
      );
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<String?> _saveDeviceToken() async {
    String? deviceToken = await FirebaseMessaging.instance.getToken();
    if (deviceToken != null) {
      debugPrint('--------Device Token---------- $deviceToken');
    }
    return deviceToken;
  }

  String getUserToken() {
    return sharedPreferences!.getString(AppConstants.token) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences!.containsKey(AppConstants.token);
  }

  Future<bool> clearSharedData() async {
    try {
      await dioClient!.post(
        AppConstants.tokenUri,
        data: {"_method": "put", "cm_firebase_token": '@', "token": sharedPreferences!.get(AppConstants.token)},
      );
    } catch (e) {
      debugPrint('error ---> $e');
    }

    await sharedPreferences!.remove(AppConstants.token);
    return true;
  }

  // For Remember Email
  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences!.setString(AppConstants.userPassword, password);
      await sharedPreferences!.setString(AppConstants.userEmail, number);
    } catch (e) {
      rethrow;
    }
  }

  String getUserEmail() {
    return sharedPreferences!.getString(AppConstants.userEmail) ?? "";
  }

  String getUserPassword() {
    return sharedPreferences!.getString(AppConstants.userPassword) ?? "";
  }

  Future<bool> clearUserNumberAndPassword() async {
    await sharedPreferences!.remove(AppConstants.userPassword);
    return await sharedPreferences!.remove(AppConstants.userEmail);
  }

  Future<http.Response> registerDeliveryMan(DeliveryManModel deliveryManBody, List<MultipartBody> multiParts) async {
    http.Response response = await dioClient!.postMultipartData(
      AppConstants.register,
      deliveryManBody.toJson(),
      multiParts,
    );
    return response;
  }
}
