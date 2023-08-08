// ignore_for_file: unused_result
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:sws/mobile_app/src/config/router/navigator.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/config/themes/fonts.dart';
import 'package:sws/mobile_app/src/domain/models/news_models/top_news_model.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/match_event_model/match.dart';
import 'package:sws/mobile_app/src/presentation/providers/news_providers.dart';
import 'package:sws/mobile_app/src/presentation/providers/soccer_providers.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/mobile_app/src/presentation/screens/home_screens/category_button_widget.dart';
import 'package:sws/mobile_app/src/presentation/screens/home_screens/home_news_widget.dart';
import 'package:sws/mobile_app/src/presentation/screens/home_screens/home_video_widget.dart';
import 'package:sws/mobile_app/src/presentation/screens/home_screens/match_widget.dart';
import 'package:sws/mobile_app/src/presentation/screens/home_screens/slider_screen.dart';
import 'package:sws/mobile_app/src/utils/constants/asset_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final matchEvents = useState<List<MatchEvent>>([]);
    final newsProvider = ref.watch(getAllNewsProvider);
    final videosProvider = ref.watch(getVideoNewsProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: const Text(
          "Silk Way Sport",
          style: TextStyle(
            color: mainColor,
            fontSize: 20,
            fontWeight: FontWeight.w800,
            fontFamily: fontFamily,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
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
                                      if (!await launchUrl(Uri.parse(
                                          'https://youtube.com/@SilkWaySport'))) {
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
                                    mode: LaunchMode.externalApplication)) {
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
                                    if (!await launchUrl(
                                        Uri.parse('tel://+998912452810'),
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
                                        Uri.parse(
                                            'mailto:silkwaysport@gmail.com'),
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
                            HBox(32.0),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
            icon: const Icon(
              Icons.more_vert_sharp,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        backgroundColor: mainColor,
        color: Colors.black,
        onRefresh: () {
          ref.refresh(getAllMatchesProvider(matchEvents));
          return Future.delayed(
            const Duration(seconds: 5),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 4.0,
          ),
          child: CustomScrollView(
            slivers: [
              const HomeSliderScreen(),
              HomeMatchWidget(eventsHelper: matchEvents),
              HomeCategoryButtonWidget(
                onTap: () {},
                title: "So'nggi yangiliklar",
                videosProvider: newsProvider,
              ),
              HomeNewsWidget(videosProvider: newsProvider),
              HomeCategoryButtonWidget(
                onTap: () {},
                title: "Tomosha qiling!",
                videosProvider: videosProvider,
              ),
              HomeVideoWidget(videosProvider: videosProvider),
              SBox(100),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}


