import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../config/app_color.dart';


void configureEasyLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..maskType = EasyLoadingMaskType.none
    ..toastPosition = EasyLoadingToastPosition.center
    ..animationStyle = EasyLoadingAnimationStyle.opacity
    ..indicatorSize = 44
    ..radius = 6
    ..progressColor =  AppColor.primaryColor
    ..backgroundColor = AppColor.primaryColor
    ..indicatorColor = AppColor.primaryColor
    ..textColor = AppColor.white
    ..maskColor = AppColor.primaryColor

    ..userInteractions = true
    ..dismissOnTap = false;

}