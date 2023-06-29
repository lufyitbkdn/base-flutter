import 'package:get/get.dart';

void navigateRightToLeft<T>(T screen) {
  Get.to<T>(
    () => screen,
    transition: Transition.rightToLeftWithFade,
  );
}
void navigateFade<T>(T screen) {
  Get.to<T>(
    () => screen,
    transition: Transition.fade,
  );
}
