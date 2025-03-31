import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:quick_eats_delivery/features/auth/controllers/auth_controller.dart';
import 'package:quick_eats_delivery/util/dimensions.dart';
import 'package:quick_eats_delivery/util/styles.dart';
import 'package:quick_eats_delivery/common/widgets/custom_button_widget.dart';
import 'package:quick_eats_delivery/common/widgets/custom_snackbar_widget.dart';
import 'package:quick_eats_delivery/common/widgets/custom_text_field_widget.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  String? countryDialCode;

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    countryDialCode = Get.find<AuthController>().getUserCountryCode().isNotEmpty
        ? Get.find<AuthController>().getUserCountryCode()
        : '+94'; // Default country code

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: Column(
              children: [
                Text('register'.tr.toUpperCase(), style: robotoBlack.copyWith(fontSize: 30)),
                const SizedBox(height: 20),
                CustomTextFieldWidget(
                  hintText: 'full_name'.tr,
                  controller: _nameController,
                  inputType: TextInputType.name,
                  border: false,
                ),
                CustomTextFieldWidget(
                  hintText: 'phone'.tr,
                  controller: _phoneController,
                  inputType: TextInputType.phone,
                  isPhone: true,
                  border: false,
                  onCountryChanged: (CountryCode countryCode) {
                    countryDialCode = countryCode.dialCode;
                  },
                  countryDialCode: countryDialCode ?? '',
                ),
                CustomTextFieldWidget(
                  hintText: 'enter_otp'.tr,
                  controller: _otpController,
                  inputType: TextInputType.number,
                  isPassword: false,
                  border: false,
                ),
                const SizedBox(height: 20),
                CustomButtonWidget(
                  buttonText: 'request_otp'.tr,
                  onPressed: () => _requestOtp(Get.find<AuthController>()),
                ),
                const SizedBox(height: 10),
                CustomButtonWidget(
                  buttonText: 'verify_otp'.tr,
                  onPressed: () => _verifyOtp(Get.find<AuthController>()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _requestOtp(AuthController authController) {
    String phone = _phoneController.text.trim();
    if (phone.isEmpty) {
      showCustomSnackBar('enter_phone_number'.tr);
    } else {
      authController.requestOtp("$countryDialCode$phone").then((status) {
        if (status.isSuccess) {
          showCustomSnackBar('otp_sent'.tr, isError: false);
        } else {
          showCustomSnackBar(status.message);
        }
      });
    }
  }

  void _verifyOtp(AuthController authController) {
    String phone = _phoneController.text.trim();
    String otp = _otpController.text.trim();
    String name = _nameController.text.trim();
    
    if (name.isEmpty) {
      showCustomSnackBar('enter_full_name'.tr);
      return;
    }
    if (otp.isEmpty) {
      showCustomSnackBar('enter_otp'.tr);
      return;
    }
    
    authController.verifyOtp("$countryDialCode$phone", otp).then((status) {
      if (status.isSuccess) {
        authController.registerUser(name, "$countryDialCode$phone").then((regStatus) {
          if (regStatus.isSuccess) {
            Get.offAllNamed('/home');
          } else {
            showCustomSnackBar(regStatus.message);
          }
        });
      } else {
        showCustomSnackBar(status.message);
      }
    });
  }
}
