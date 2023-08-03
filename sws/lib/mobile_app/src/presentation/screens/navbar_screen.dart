import 'package:flutter/material.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/mobile_app/src/utils/constants/asset_icons.dart';

class NavBar extends StatelessWidget {
  final PageController controller;
  final ValueNotifier<int> page;
  final ValueNotifier<double> x;
  final ValueNotifier<double> y;
  final ValueNotifier<bool> showBall;

  const NavBar({
    super.key,
    required this.controller,
    required this.page,
    required this.showBall,
    required this.x,
    required this.y,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      // margin: const EdgeInsets.only(
      //   left: 32,
      //   right: 32,
      // ),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          SizedBox(
            height: 60,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                page.value == 0
                    ? selected("Asosiy", AssetIcons.home, showBall.value)
                    : unselected("Asosiy", AssetIcons.home, () {
                        controller.jumpToPage(0);
                        page.value = 0;
                        showBall.value = true;
                        x.value = -0.72;
                      }),
                page.value == 1
                    ? selected("Yangiliklar", AssetIcons.news, showBall.value)
                    : unselected("Yangiliklar", AssetIcons.news, () {
                        controller.jumpToPage(1);
                        page.value = 1;
                        showBall.value = true;
                        x.value = -0.2;
                      }),
                page.value == 2
                    ? selected("Musobaqalar", AssetIcons.league, showBall.value)
                    : unselected("Musobaqalar", AssetIcons.league, () {
                        controller.jumpToPage(2);
                        page.value = 2;
                        showBall.value = true;
                        x.value = 0.32;
                      }),
                page.value == 3
                    ? selected("TV", AssetIcons.tv, showBall.value)
                    : unselected("TV", AssetIcons.tv, () {
                        controller.jumpToPage(3);
                        page.value = 3;
                        showBall.value = true;
                        x.value = 0.75;
                      }),
              ],
            ),
          ),
          AnimatedBall(showBall: showBall, x: x, y: y)
        ],
      ),
    );
  }

  Widget selected(String title, String path, bool showBall) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ImageIcon(
          AssetImage(path),
          color: !showBall ? mainColor : Colors.white,
        ),
        HBox(4.0),
        Text(
          title,
          style: TextStyle(
            color: !showBall ? mainColor : Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget unselected(String title, String path, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageIcon(
            AssetImage(path),
            color: Colors.white,
          ),
          HBox(4.0),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedBall extends StatelessWidget {
  final ValueNotifier<bool> showBall;
  final ValueNotifier<double> x;
  final ValueNotifier<double> y;

  const AnimatedBall({
    super.key,
    required this.showBall,
    required this.x,
    required this.y,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedAlign(
      duration: const Duration(milliseconds: 300),
      onEnd: () {
        showBall.value = false;
      },
      alignment: Alignment(x.value, 0.0),
      child: showBall.value
          ? const ImageIcon(
              AssetImage(AssetIcons.ball),
              color: mainColor,
              size: 20,
            )
          : HBox(0.0),
    );
  }
}
