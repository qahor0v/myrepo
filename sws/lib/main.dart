import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sws/mobile_app/mobile_main.dart';
import 'package:sws/mobile_app/src/utils/constants/keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
    ),
  );
  Firestore.initialize(projectID);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
