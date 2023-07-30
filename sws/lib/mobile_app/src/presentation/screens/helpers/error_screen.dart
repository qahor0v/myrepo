import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppError extends StatelessWidget {
  const AppError({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        "assets/animations/animation_lkmc5xa3.json",
      ),
    );
  }
}
