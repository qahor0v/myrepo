import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sws/mobile_app/src/config/router/navigator.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/config/themes/fonts.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/mobile_app/src/utils/constants/asset_icons.dart';
import 'package:sws/mobile_app/src/utils/extensions/sharer.dart';
import 'package:url_launcher/url_launcher.dart';

void homeMore(BuildContext context, String url) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return BottomSheet(
        backgroundColor: kDarkColor,
        onClosing: () {},
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              left: 24.0,
              right: 24.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: 200,
                    height: 4,
                  ),
                  onTap: () {
                    close(context);
                  },
                ),
                HBox(24.0),
                const Text(
                  "Silk Way Sport ijtimoiy tarmoqlarda",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: fontFamily,
                  ),
                ),
                HBox(16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: Image.asset(
                        AssetIcons.instagram,
                        height: 50,
                      ),
                      onTap: () async {
                        if (!await launchUrl(Uri.parse(
                            'https://instagram.com/silk.way.sport'))) {
                          throw Exception('Xatolik!');
                        }
                      },
                    ),
                    InkWell(
                        child: Image.asset(
                          AssetIcons.youtube,
                          height: 50,
                        ),
                        onTap: () async {
                          if (!await launchUrl(
                              Uri.parse('https://youtube.com/@SilkWaySport'))) {
                            throw Exception('Xatolik!');
                          }
                        }),
                    InkWell(
                      child: Image.asset(
                        AssetIcons.telegram,
                        height: 50,
                      ),
                      onTap: () async {
                        if (!await launchUrl(
                            Uri.parse('https://t.me/silkway_sport'),
                            mode: LaunchMode.externalApplication)) {
                          throw Exception('Xatolik!');
                        }
                      },
                    ),
                  ],
                ),
                HBox(32.0),
                const Text(
                  "Natijalarni Telegram bot orqali kuzating",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: fontFamily,
                  ),
                ),
                HBox(16.0),
                InkWell(
                  child: const ImageIcon(
                    AssetImage(
                      AssetIcons.bot,
                    ),
                    size: 50,
                    color: mainColor,
                  ),
                  onTap: () async {
                    if (!await launchUrl(
                      Uri.parse('https://t.me/silkway_sport_bot'),
                      mode: LaunchMode.externalApplication,
                    )) {
                      throw Exception('Xatolik!');
                    }
                  },
                ),
                HBox(32.0),
                const Text(
                  "Taklif va murojaatlar uchun",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: fontFamily,
                  ),
                ),
                HBox(16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      child: const Icon(
                        Icons.call,
                        color: Colors.greenAccent,
                        size: 40,
                      ),
                      onTap: () async {
                        if (!await launchUrl(Uri.parse('tel://+998912452810'),
                            mode: LaunchMode.externalApplication)) {
                          throw Exception('Xatolik!');
                        }
                      },
                    ),
                    InkWell(
                      child: const Icon(
                        Icons.email_outlined,
                        color: Colors.greenAccent,
                        size: 40,
                      ),
                      onTap: () async {
                        if (!await launchUrl(
                            Uri.parse('mailto:silkwaysport@gmail.com'),
                            mode: LaunchMode.externalApplication)) {
                          throw Exception('Xatolik!');
                        }
                      },
                    ),
                    InkWell(
                      child: const Icon(
                        IconlyLight.chat,
                        color: Colors.greenAccent,
                        size: 40,
                      ),
                      onTap: () async {
                        if (!await launchUrl(
                            Uri.parse('https://t.me/sws_admin'),
                            mode: LaunchMode.externalApplication)) {
                          throw Exception('Xatolik!');
                        }
                      },
                    ),
                  ],
                ),
                HBox(48.0),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        share(
                            "Slik Way Sport - Endi sport biz bilan!\nYuklab oling: ${url}");
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.share, color: mainColor),
                          WBox(4.0),
                          const Text(
                            "Ilovani ulashish",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () async {
                        if (!await launchUrl(Uri.parse(url))) {
                          throw Exception('Xatolik!');
                        }
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.star_rate, color: mainColor),
                          WBox(4.0),
                          const Text(
                            "Ilovani baholash",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                HBox(16.0),
              ],
            ),
          );
        },
      );
    },
  );
}
