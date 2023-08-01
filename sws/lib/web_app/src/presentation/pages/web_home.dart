// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
  import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/config/themes/fonts.dart';
  import 'package:sws/web_app/src/presentation/screens/desktop_screens/app_bar.dart';
import 'package:sws/web_app/src/presentation/screens/desktop_screens/home_match_widget.dart';
import 'package:sws/web_app/src/presentation/screens/desktop_screens/home_news_screen.dart';
import 'package:sws/web_app/src/presentation/screens/siderbar.dart';
 import 'package:sws/web_app/src/utils/extensions/get_device_type.dart';

class WebHome extends StatelessWidget {
  const WebHome({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contrains) {
        DeviceType type = getDeviceType(context);
        bool isDesktop = (type == DeviceType.DESKTOP);
        bool isMobile = (type == DeviceType.MOBILE);
        bool isTablet = (type == DeviceType.TABLET);
        return Scaffold(
          drawer: isMobile ? const WebSidebar() : null,
          appBar: isMobile
              ? AppBar(
                  iconTheme: const IconThemeData(color: Colors.white),
                  backgroundColor: Colors.black,
                  elevation: 0.0,
                  title: const Text(
                    "Silk Way Sport",
                    style: TextStyle(
                      color: mainColor,
                      fontFamily: fontFamily,
                    ),
                  ),
                )
              : null,
          body: Center(
            child: SizedBox(
              width: isDesktop || isTablet
                  ? 900
                  : MediaQuery.of(context).size.width,
              child: CustomScrollView(
                slivers: [
                  if (isDesktop || isTablet) const WebHomeAppBar(index: 0),
                  
                  if (isDesktop || isTablet) WebHomeMatchWidget(),

                  if (isDesktop || isTablet) WebHomeNewsScreen(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

