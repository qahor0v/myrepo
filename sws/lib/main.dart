import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sws/mobile_app/mobile_main.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
