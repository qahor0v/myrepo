import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:sws/mobile_app/src/utils/constants/asset_paths.dart';

class AppEmptyWidget extends StatelessWidget {
  const AppEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AssetPaths.empty,
        fit: BoxFit.cover,
      ),
    );
  }
}
