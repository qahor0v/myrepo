import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sws/mobile_app/src/domain/repository/db_services/check_update.dart';
import 'package:sws/mobile_app/src/presentation/providers/key_provider.dart';

class SplashPage extends StatefulHookConsumerWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  void getUpdate() async {
    await UpdateChecker.get().then((value) {
      log("KEY: ${value!.update}");
      log("KEY: ${value.key}");
      ref.read(keyProvider.notifier).state = value;
      Navigator.pushReplacementNamed(context, 'home');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
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
