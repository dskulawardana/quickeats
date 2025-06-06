import 'package:flutter/material.dart';
import 'package:quick_eats_delivery_boy/localization/app_localization.dart';

String? getTranslated(String? key, BuildContext context) {
  String? text = key;
  try{
    text = AppLocalization.of(context)!.translate(key);
  }catch (error){
    debugPrint('not localized --- $error');

  }
  return text;
}