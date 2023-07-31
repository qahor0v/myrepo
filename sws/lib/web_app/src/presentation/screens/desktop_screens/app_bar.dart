import 'package:flutter/material.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/config/themes/fonts.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/web_app/src/presentation/widgets/focused_wrapper.dart';

class WebHomeAppBar extends StatelessWidget {
  const WebHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: const Text(
                  "Silk Way Sport",
                  style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    fontFamily: fontFamily,
                  ),
                ),
              ),
            ),
            const Spacer(),
            WBox(16.0),
            FocusedWrapper(
              child: (bool isFocused) {
                return AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    "Bosh sahifa",
                    style: TextStyle(
                      color: isFocused ? mainColor : Colors.white,
                      fontSize: isFocused ? 18 : 16,
                      fontWeight: isFocused ? FontWeight.bold : FontWeight.w400,
                      fontFamily: fontFamily2,
                    ),
                  ),
                );
              },
            ),
            WBox(16.0),
            FocusedWrapper(
              child: (bool isFocused) {
                return AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    "Yangiliklar",
                    style: TextStyle(
                      color: isFocused ? mainColor : Colors.white,
                      fontSize: isFocused ? 18 : 16,
                      fontWeight: isFocused ? FontWeight.bold : FontWeight.w400,
                      fontFamily: fontFamily2,
                    ),
                  ),
                );
              },
            ),
            WBox(16.0),
            FocusedWrapper(
              child: (bool isFocused) {
                return AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    "Ligalar",
                    style: TextStyle(
                      color: isFocused ? mainColor : Colors.white,
                      fontSize: isFocused ? 18 : 16,
                      fontWeight: isFocused ? FontWeight.bold : FontWeight.w400,
                      fontFamily: fontFamily2,
                    ),
                  ),
                );
              },
            ),
            WBox(16.0),
            FocusedWrapper(
              child: (bool isFocused) {
                return AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    "TV",
                    style: TextStyle(
                      color: isFocused ? mainColor : Colors.white,
                      fontSize: isFocused ? 18 : 16,
                      fontWeight: isFocused ? FontWeight.bold : FontWeight.w400,
                      fontFamily: fontFamily2,
                    ),
                  ),
                );
              },
            ),
            WBox(16.0),
            FocusedWrapper(
              child: (bool isFocused) {
                return AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    "Biz haqimizda",
                    style: TextStyle(
                      color: isFocused ? mainColor : Colors.white,
                      fontSize: isFocused ? 18 : 16,
                      fontWeight: isFocused ? FontWeight.bold : FontWeight.w400,
                      fontFamily: fontFamily2,
                    ),
                  ),
                );
              },
            ),
            WBox(8.0),
          ],
        ),
      ),
    );
  }
}
