import 'package:flutter/material.dart';
import 'package:sws/mobile_app/src/config/router/routers.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/web_app/src/presentation/pages/web_loading_page.dart';
import 'package:sws/web_app/src/presentation/widgets/helpers/back_wrapper.dart';

class MyWebApp extends StatelessWidget {
  const MyWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Silk Way Sport',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
        useMaterial3: true,
      ),
      home: const WebBackWrapper(child: WebSplashPage()),
      routes: WebRouters.routers,
    );
  }
}
