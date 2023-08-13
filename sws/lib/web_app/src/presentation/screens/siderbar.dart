import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sws/mobile_app/src/config/router/navigator.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/config/themes/fonts.dart';
import 'package:sws/mobile_app/src/utils/constants/asset_icons.dart';

class WebSidebar extends StatelessWidget {
  final int index;
  const WebSidebar({
    super.key,
    required this.index,
  });

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
              leading: ImageIcon(
                const AssetImage(AssetIcons.home),
                color: index == 0 ? mainColor : Colors.white,
              ),
              title: Text(
                "Bosh sahifa",
                style: TextStyle(
                  color: index == 0 ? mainColor : Colors.white,
                  fontFamily: fontFamily2,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: ImageIcon(
                const AssetImage(AssetIcons.news),
                color: index == 1 ? mainColor : Colors.white,
              ),
              title: Text(
                "Yangiliklar",
                style: TextStyle(
                  color: index == 1 ? mainColor : Colors.white,
                  fontFamily: fontFamily2,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: ImageIcon(
                const AssetImage(AssetIcons.league),
                color: index == 2 ? mainColor : Colors.white,
              ),
              title: Text(
                "Ligalar",
                style: TextStyle(
                  color: index == 2 ? mainColor : Colors.white,
                  fontFamily: fontFamily2,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: ImageIcon(
                AssetImage(AssetIcons.tv),
                color: index == 3 ? mainColor : Colors.white,
              ),
              title: Text(
                "TV",
                style: TextStyle(
                  color: index == 3 ? mainColor : Colors.white,
                  fontFamily: fontFamily2,
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                IconlyLight.info_circle,
                color: index == 4 ? mainColor : Colors.white,
              ),
              title: Text(
                "Biz haqimizda",
                style: TextStyle(
                  color: index == 4 ? mainColor : Colors.white,
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
