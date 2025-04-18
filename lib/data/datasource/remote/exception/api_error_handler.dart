// ignore_for_file: empty_catches

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:quick_eats_delivery_boy/common/models/error_response_model.dart';
import 'package:quick_eats_delivery_boy/localization/language_constrants.dart';
import 'package:quick_eats_delivery_boy/main.dart';

class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = "";
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              errorDescription = "Request to API server was cancelled";
              break;

            case DioExceptionType.receiveTimeout:
              errorDescription =
              "Receive timeout in connection with API server";
              break;
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
                case 500:
                case 503:
                  errorDescription = error.response!.statusMessage;
                  break;
                default:
                  ErrorResponseModel? errorResponse;
                  try {
                    errorResponse = ErrorResponseModel.fromJson(error.response!.data);
                  }catch(e) {
                    debugPrint('error is -> ${e.toString()}');

                  }

                  if (errorResponse != null && errorResponse.errors != null && errorResponse.errors!.isNotEmpty) {
                    debugPrint('error----------------== ${errorResponse.errors![0].message} || error: ${error.response!.requestOptions.uri}');

                    errorDescription = errorResponse.toJson();
                  } else {
                    errorDescription =
                    "Failed to load data - status code: ${error.response!.statusCode}";
                  }
              }
              break;
            case DioExceptionType.sendTimeout:
              errorDescription = getTranslated('send_timeout_with_server', Get.context!);
              break;
            case DioExceptionType.connectionTimeout:
              errorDescription = getTranslated('send_timeout_with_server', Get.context!);
              // TODO: Handle this case.
              break;
            case DioExceptionType.badCertificate:
              errorDescription = getTranslated('incorrect_certificate', Get.context!);
              // TODO: Handle this case.
              break;
            case DioExceptionType.connectionError:
              errorDescription = getTranslated('unavailable_to_process_data', Get.context!);
              // TODO: Handle this case.
              break;
            case DioExceptionType.unknown:
              debugPrint('error----------------== ${error.response?.data}');

              errorDescription = getTranslated('unavailable_to_process_data', Get.context!);
              // TODO: Handle this case.
              break;
          }
        } else {
          errorDescription = "Unexpected error occured";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "is not a subtype of exception";
    }
    return errorDescription;
  }
}
