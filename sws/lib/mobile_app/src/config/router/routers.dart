import 'package:flutter/material.dart';
import 'package:sws/mobile_app/src/presentation/pages/navbar_pages/home.dart';
import 'package:sws/web_app/src/presentation/pages/web_home.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routers = {
    Home.id: (context) => const Home(),
  };
}

class WebRouters {
   static Map<String, WidgetBuilder> routers = {
    WebHome.id: (context) => const WebHome(),
  };
}
