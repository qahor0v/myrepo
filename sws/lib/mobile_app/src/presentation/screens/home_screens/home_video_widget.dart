import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:sws/mobile_app/src/config/router/navigator.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/domain/models/news_models/video_news.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/mobile_app/src/presentation/screens/news_screens/open_video_news.dart';
import 'package:sws/mobile_app/src/presentation/screens/shimmers/app_shimmer.dart';
import 'package:sws/mobile_app/src/utils/extensions/time_parsers.dart';

class HomeVideoWidget extends HookConsumerWidget {
  final AsyncValue<List> videosProvider;

  const HomeVideoWidget({
    super.key,
    required this.videosProvider,
  });

  @override
  Widget build(BuildContext context, ref) {
    // "${TimeParser.parse(news.createdTime).time} / ${TimeParser.parse(news.createdTime).date}"
    return SliverToBoxAdapter(
      child: videosProvider.when(
        data: (data) {
          return Column(
            children: [
              ...List.generate(data.length > 8 ? 8 : data.length, (index) {
                VideoNews news = data[index] as VideoNews;

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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
