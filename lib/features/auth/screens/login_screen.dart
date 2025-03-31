import 'package:country_code_picker/country_code_picker.dart';
import 'package:quick_eats_delivery/features/auth/controllers/auth_controller.dart';
import 'package:quick_eats_delivery/features/splash/controllers/splash_controller.dart';
import 'package:quick_eats_delivery/helper/route_helper.dart';
import 'package:quick_eats_delivery/util/dimensions.dart';
import 'package:quick_eats_delivery/util/images.dart';
import 'package:quick_eats_delivery/util/styles.dart';
import 'package:quick_eats_delivery/common/widgets/custom_button_widget.dart';
import 'package:quick_eats_delivery/common/widgets/custom_snackbar_widget.dart';
import 'package:quick_eats_delivery/common/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  final FocusNode _phoneFocus = FocusNode();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  
  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? countryDialCode = Get.find<AuthController>().getUserCountryCode().isNotEmpty
        ? Get.find<AuthController>().getUserCountryCode()
        : CountryCode.fromCountryCode(Get.find<SplashController>().configModel!.country!).dialCode;
    _phoneController.text = Get.find<AuthController>().getUserNumber();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: Center(
              child: SizedBox(
                width: 1170,
                child: GetBuilder<AuthController>(builder: (authController) {
                  return Column(
                    children: [
                      Image.asset(Images.logo, width: 200),
                      const SizedBox(height: Dimensions.paddingSizeExtraLarge),
                      Text('sign_in'.tr.toUpperCase(), style: robotoBlack.copyWith(fontSize: 30)),
                      const SizedBox(height: 50),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                          color: Theme.of(context).cardColor,
                          boxShadow: Get.isDarkMode ? null : [BoxShadow(color: Colors.grey[200]!, spreadRadius: 1, blurRadius: 5)],
                        ),
                        child: Column(
                          children: [
                            CustomTextFieldWidget(
                              hintText: 'phone'.tr,
                              controller: _phoneController,
                              focusNode: _phoneFocus,
                              inputType: TextInputType.phone,
                              divider: true,
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
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      !authController.isLoading
                          ? Column(
                              children: [
                                CustomButtonWidget(
                                  buttonText: 'request_otp'.tr,
                                  onPressed: () => _requestOtp(authController, _phoneController, countryDialCode!, context),
                                ),
                                const SizedBox(height: 10),
                                CustomButtonWidget(
                                  buttonText: 'verify_otp'.tr,
                                  onPressed: () => _verifyOtp(authController, _phoneController, _otpController, countryDialCode!, context),
                                ),
                              ],
                            )
                          : const Center(child: CircularProgressIndicator()),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _requestOtp(AuthController authController, TextEditingController phoneText, String countryCode, BuildContext context) async {
    String phone = phoneText.text.trim();
    String numberWithCountryCode = "$countryCode$phone";
    
    if (phone.isEmpty) {
      showCustomSnackBar('enter_phone_number'.tr);
    } else {
      authController.requestOtp(numberWithCountryCode).then((status) {
        if (status.isSuccess) {
          showCustomSnackBar('otp_sent'.tr, isError: false);
        } else {
          showCustomSnackBar(status.message);
        }
      });
    }
  }

  void _verifyOtp(AuthController authController, TextEditingController phoneText, TextEditingController otpText, String countryCode, BuildContext context) async {
    String phone = phoneText.text.trim();
    String otp = otpText.text.trim();
    String numberWithCountryCode = "$countryCode$phone";
    
    if (otp.isEmpty) {
      showCustomSnackBar('enter_otp'.tr);
    } else {
      authController.verifyOtp(numberWithCountryCode, otp).then((status) {
        if (status.isSuccess) {
          Get.offAllNamed(RouteHelper.getInitialRoute());
        } else {
          showCustomSnackBar(status.message);
        }
      });
    }
  }
}
