import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sws/mobile_app/src/config/router/navigator.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/config/themes/fonts.dart';
import 'package:sws/mobile_app/src/domain/models/news_models/video_news.dart';
import 'package:sws/mobile_app/src/presentation/pages/navbar_pages/news_page.dart';
import 'package:sws/mobile_app/src/presentation/pages/player_pages/open_youtube_player.dart';
import 'package:sws/mobile_app/src/presentation/pages/webview_pages/open_url.dart';
import 'package:sws/mobile_app/src/presentation/providers/news_providers.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/mobile_app/src/presentation/screens/news_screens/open_video_news.dart';
import 'package:sws/mobile_app/src/presentation/screens/shimmers/app_shimmer.dart';
import 'package:sws/mobile_app/src/utils/extensions/time_parsers.dart';

class TVPage extends HookConsumerWidget {
  const TVPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final lives = ref.watch(getLiveMatchesProvider);
    final videos = ref.watch(getVideoNewsProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HBox(16.0),
              lives.when(
                data: (data) {
                  if (data.isNotEmpty) {
                    return const NewsPageTitle(title: "Jonli efir");
                  } else {
                    return WBox(0.0);
                  }
                },
                error: (e, m) => WBox(0.0),
                loading: () => WBox(0.0),
              ),
              HBox(8.0),
              SizedBox(
                height: 170,
                child: lives.when(
                  data: (data) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final e = data[index];
                        return GestureDetector(
                          onTap: () {
                            if (e.useWebView) {
                              go(context, WebViewPage(url: e.url));
                            } else {
                              go(context, OpenYouTubePlayerPage(id: e.url));
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: e.banner,
                              height: 170,
                              width: MediaQuery.of(context).size.width * 0.6,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height: 170,
                                width: MediaQuery.of(context).size.width * 0.6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Container(
                                  height: 170,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black,
                                        Colors.transparent,
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            size: 16,
                                            color: Colors.redAccent,
                                          ),
                                          Text(
                                            " Live",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: fontFamily,
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        e.title,
                                        maxLines: 2,
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: baseColor,
                                highlightColor: highlightColor,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  error: (a, b) {
                    return WBox(0.0);
                  },
                  loading: () => const AppShimmer(),
                ),
              ),
              HBox(16.0),
              videos.when(
                data: (data) {
                  if (data.isNotEmpty) {
                    return const NewsPageTitle(title: "So'nngi videolar");
                  } else {
                    return WBox(0.0);
                  }
                },
                error: (e, m) => WBox(0.0),
                loading: () => WBox(0.0),
              ),
              videos.when(
                data: (data) {
                  return Column(
                    children: [
                      ...List.generate(data.length, (index) {
                        VideoNews news = data[index];

                        return GestureDetector(
                          onTap: () {
                            go(context, OpenVideoNews(news: news));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 4.0,
                              bottom: 8.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: kDarkColor,
                            ),
                            height: 120,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: CachedNetworkImage(
                                          height: double.infinity,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                          imageUrl: news.banner,

                                          placeholder: (context, url) {
                                            return const AppShimmer();
                                          },
                                          // errorWidget: (context, e, b){
                                          //   return ErrorHint(message);
                                          // },
                                        ),
                                      ),
                                      const Center(
                                        child: Icon(
                                          IconlyBold.play,
                                          color: mainColor,
                                          size: 36,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          news.title,
                                          style: GoogleFonts.robotoCondensed(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          maxLines: 4,
                                          textAlign: TextAlign.left,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              IconlyLight.calendar,
                                              color: Colors.grey,
                                              size: 20,
                                            ),
                                            WBox(2.0),
                                            Text(
                                              "${TimeParser.parse(news.createdTime).time} / ${TimeParser.parse(news.createdTime).date}",
                                              style: GoogleFonts.inter(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                    ],
                  );
                },
                error: (e, m) {
                  log("Getting a video news error: ", error: e, stackTrace: m);
                  return WBox(0.0);
                },
                loading: () => WBox(0.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
