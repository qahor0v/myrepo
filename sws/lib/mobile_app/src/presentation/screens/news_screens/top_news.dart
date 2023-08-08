import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sws/mobile_app/src/config/themes/fonts.dart';
import 'package:sws/mobile_app/src/domain/models/news_models/top_news_model.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/back_button.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/mobile_app/src/presentation/screens/shimmers/app_shimmer.dart';
import 'package:sws/mobile_app/src/utils/extensions/time_parsers.dart';

class OpenTopNewsPage extends StatelessWidget {
  final TopNews news;

  const OpenTopNewsPage({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppBackButton(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              HBox(8.0),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Text(
                  news.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: fontFamily,
                  ),
                ),
              ),
              HBox(8.0),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: CachedNetworkImage(
                  width: double.infinity,
                  fit: BoxFit.cover,
                  imageUrl: news.banner,
                  placeholder: (c, s) {
                    return const AppShimmer();
                  },
                ),
              ),
              HBox(16.0),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Text(
                  news.text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: fontFamily2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              HBox(32.0),
              if (news.source.isNotEmpty)
                Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "Manba: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          news.source,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, top: 16.0),
                  child: Row(
                    children: [
                      Text(
                        "${TimeParser.parse(news.createdTime).date} | ${TimeParser.parse(news.createdTime).time} ",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        " da qo'shildi",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
