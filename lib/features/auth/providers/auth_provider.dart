import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:quick_eats_delivery/common/models/response_model.dart';
import 'package:quick_eats_delivery/data/datasource/remote/dio/dio_client.dart';
import 'package:quick_eats_delivery/features/auth/domain/models/delivery_man_model.dart';
import 'package:quick_eats_delivery/common/models/api_response_model.dart';
import 'package:quick_eats_delivery/common/models/error_response_model.dart';
import 'package:quick_eats_delivery/common/models/config_model.dart';
import 'package:quick_eats_delivery/features/auth/domain/repositories/auth_repo.dart';
import 'package:quick_eats_delivery/helper/api_checker_helper.dart';
import 'package:quick_eats_delivery/localization/language_constants.dart';
import 'package:quick_eats_delivery/main.dart';
import 'package:quick_eats_delivery/helper/show_custom_snackbar_helper.dart';
import 'package:http/http.dart' as http;
import '../../splash/providers/splash_provider.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo authRepo;

  AuthProvider({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  XFile? _pickedImage;
  List<XFile> _pickedIdentities = [];
  final List<String> _identityTypeList = ['passport', 'driving_license', 'nid', 'restaurant_id'];
  int _identityTypeIndex = 0;
  XFile? get pickedImage => _pickedImage;
  List<XFile> get pickedIdentities => _pickedIdentities;
  int get identityTypeIndex => _identityTypeIndex;

  Future<ResponseModel> login({required String emailAddress, required String password}) async {
    _isLoading = true;
    notifyListeners();
    ApiResponseModel apiResponse = await authRepo.login(emailAddress: emailAddress, password: password);

    ResponseModel responseModel;
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      Map<String, dynamic> map = apiResponse.response!.data;
      String token = map["token"];
      authRepo.saveUserToken(token);
      responseModel = ResponseModel(true, '');
      await updateToken();
    } else {
      String errorMessage = ApiCheckerHelper.getError(apiResponse).errors?.first.message ?? 'Login failed';
      responseModel = ResponseModel(false, errorMessage);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<void> updateToken() async {
    ApiResponseModel apiResponse = await authRepo.updateToken();
    if (apiResponse.response?.statusCode != 200) {
      ApiCheckerHelper.checkApi(apiResponse);
    }
  }

  Future<void> registerDeliveryMan(DeliveryManModel deliveryManBody) async {
    _isLoading = true;
    notifyListeners();

    List<MultipartBody> multiParts = [];
    if (_pickedImage != null) {
      multiParts.add(MultipartBody('image', _pickedImage!));
    }
    for (XFile file in _pickedIdentities) {
      multiParts.add(MultipartBody('identity_image[]', file));
    }

    try {
      http.Response? apiResponse = await authRepo.registerDeliveryMan(deliveryManBody, multiParts);
      if (apiResponse != null && apiResponse.statusCode == 200) {
        Navigator.of(Get.context!).pop();
        showCustomSnackBarHelper(getTranslated('delivery_man_registration_successful', Get.context!)!, isError: false);
      } else {
        dynamic errorResponse;
        try {
          errorResponse = jsonDecode(apiResponse!.body)['message'];
        } catch (er) {
          errorResponse = apiResponse?.body ?? 'Registration failed';
        }
        showCustomSnackBarHelper(errorResponse);
      }
    } catch (e) {
      showCustomSnackBarHelper('Something went wrong!');
    }
    _isLoading = false;
    notifyListeners();
  }

  void pickDmImage(bool isRemove) async {
    if (isRemove) {
      _pickedImage = null;
      _pickedIdentities = [];
    } else {
      XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (xFile != null) {
        _pickedIdentities.add(xFile);
      }
    }
    notifyListeners();
  }
}
