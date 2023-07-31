import 'package:flutter/material.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/config/themes/fonts.dart';

class WebHomeCategoryTitleWidget extends StatelessWidget {
  final String title;
  const WebHomeCategoryTitleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 24,
          bottom: 8,
          left: 32,
          right: 32,
        ),
        child: Text(
          title,
          // ignore: prefer_const_constructors
          style: TextStyle(
            color: mainColor,
            fontSize: 17,
            fontWeight: FontWeight.w400,
            fontFamily: fontFamily2,
          ),
        ),
      ),
    );
  }
}
