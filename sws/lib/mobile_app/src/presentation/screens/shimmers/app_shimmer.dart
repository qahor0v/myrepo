import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
      ),
    );
  }
}
