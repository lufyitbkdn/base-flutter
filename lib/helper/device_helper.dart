import 'package:flutter/cupertino.dart';

enum DeviceType { phone, tablet }

DeviceType getDeviceType() {
  // ignore: deprecated_member_use
  final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
  return data.size.shortestSide < 600 ? DeviceType.phone : DeviceType.tablet;
}

bool isTablet() => getDeviceType() == DeviceType.tablet;
