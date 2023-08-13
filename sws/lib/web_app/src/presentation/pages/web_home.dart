// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/config/themes/fonts.dart';
import 'package:sws/web_app/src/presentation/providers/score_providers.dart';
import 'package:sws/web_app/src/presentation/screens/desktop_screens/app_bar.dart';
import 'package:sws/web_app/src/presentation/screens/desktop_screens/home_match_widget.dart';
import 'package:sws/web_app/src/presentation/screens/desktop_screens/home_news_screen.dart';
import 'package:sws/web_app/src/presentation/screens/siderbar.dart';
import 'package:sws/web_app/src/presentation/widgets/helpers/back_wrapper.dart';
import 'package:sws/web_app/src/utils/extensions/get_device_type.dart';
import 'package:sws/web_app/src/utils/extensions/update_checker.dart';

class WebHome extends StatefulHookConsumerWidget {
  static const String id = 'home';
  const WebHome({super.key});

  @override
  ConsumerState<WebHome> createState() => _WebHomeState();
}

class _WebHomeState extends ConsumerState<WebHome> {
  void getUpdate() async {
    await UpdateCheckerWeb.get().then((value) {
      log("KEY: ${value!.update}");
      log("KEY: ${value.key}");
      ref.read(webKeyProvider.notifier).state = value;
    });
  }

  @override
  void initState() {
    super.initState();
    getUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contrains) {
        DeviceType type = getDeviceType(context);
        bool isDesktop = (type == DeviceType.DESKTOP);
        bool isMobile = (type == DeviceType.MOBILE);
        bool isTablet = (type == DeviceType.TABLET);
        return WebBackWrapper(
          child: Scaffold(
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
          ),    
        );
      },
    );
  }
}

// class WebButton extends StatelessWidget {
//   const WebButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FocusedWrapper(
//       child: (focused) {
//         return 
//       },
//     );
//   }
// }
