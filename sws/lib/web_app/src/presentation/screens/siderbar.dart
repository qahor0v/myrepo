import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sws/mobile_app/src/config/router/navigator.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/config/themes/fonts.dart';
import 'package:sws/mobile_app/src/utils/constants/asset_icons.dart';

class WebSidebar extends StatelessWidget {
  const WebSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kDarkColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                close(context);
              },
              leading: const ImageIcon(
                AssetImage(AssetIcons.home),
                color: Colors.white,
              ),
              title: const Text(
                "Bosh sahifa",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: fontFamily2,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const ImageIcon(
                AssetImage(AssetIcons.news),
                color: Colors.white,
              ),
              title: const Text(
                "Yangiliklar",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: fontFamily2,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const ImageIcon(
                AssetImage(AssetIcons.league),
                color: Colors.white,
              ),
              title: const Text(
                "Ligalar",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: fontFamily2,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const ImageIcon(
                AssetImage(AssetIcons.tv),
                color: Colors.white,
              ),
              title: const Text(
                "TV",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: fontFamily2,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                IconlyLight.info_circle,
                color: Colors.white,
              ),
              title: const Text(
                "Biz haqimizda",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: fontFamily2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
