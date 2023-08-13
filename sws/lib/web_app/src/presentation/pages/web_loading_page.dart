import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
  import 'package:sws/web_app/src/presentation/providers/score_providers.dart';
import 'package:sws/web_app/src/utils/extensions/update_checker.dart';

class WebSplashPage extends StatefulHookConsumerWidget {
  const WebSplashPage({super.key});

  @override
  ConsumerState<WebSplashPage> createState() => _WebSplashPageState();
}

class _WebSplashPageState extends ConsumerState<WebSplashPage> {
  void getUpdate() async {
    await UpdateCheckerWeb.get().then((value) {
      log("KEY: ${value!.update}");
      log("KEY: ${value.key}");
      ref.read(webKeyProvider.notifier).state = value;
      Navigator.pushReplacementNamed(context, 'home');
    });
  }

  @override
  void initState() {
    super.initState();
    getUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          "assets/animations/loading.json",
        ),
      ),
    );
  }
}
