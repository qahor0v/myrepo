import 'package:flutter/material.dart';
import 'package:sws/mobile_app/src/presentation/pages/navbar_pages/home.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routers = {
    Home.id: (context) => const Home(),
  };
}
