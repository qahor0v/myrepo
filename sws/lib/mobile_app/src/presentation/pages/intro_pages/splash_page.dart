import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sws/mobile_app/src/config/router/navigator.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/domain/repository/db_services/check_update.dart';
import 'package:sws/mobile_app/src/presentation/providers/key_provider.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:url_launcher/url_launcher.dart';

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
      if (value.update) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.black,
              titleTextStyle: const TextStyle(
                color: mainColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              icon: const Icon(Icons.warning_amber, color: mainColor),
              title: const Text("Diqqat"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Ilovada yangilanish mavjud. Iltimos, foydalanish uchun avval ilovani yangilang!",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  HBox(16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          close(context);
                        },
                        child: const Text(
                          "Yopish",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      WBox(24.0),
                      InkWell(
                        onTap: () async {
                          if (!await launchUrl(
                            Uri.parse(value.url),
                            mode: LaunchMode.externalApplication,
                          )) {
                            throw Exception('Xatolik!');
                          }
                        },
                        child: const Text(
                          "Yangilash",
                          style: TextStyle(
                            color: mainColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      } else {
        Navigator.pushReplacementNamed(context, 'home');
      }
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
