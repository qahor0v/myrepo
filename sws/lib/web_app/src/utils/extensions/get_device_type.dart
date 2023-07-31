// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum DeviceType {
  MOBILE,
  TABLET,
  DESKTOP,
}

DeviceType getDeviceType(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth < 600) {
    return DeviceType.MOBILE;
  } else if (screenWidth < 1200) {
    return DeviceType.TABLET;
  } else {
    return DeviceType.DESKTOP;
  }
}
