import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sws/mobile_app/src/config/themes/fonts.dart';
import 'package:sws/mobile_app/src/domain/models/news_models/top_news_model.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/back_button.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/mobile_app/src/presentation/screens/shimmers/app_shimmer.dart';
import 'package:sws/mobile_app/src/utils/extensions/time_parsers.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class OpenTopNewsPage extends StatefulWidget {
  final TopNews news;

  const OpenTopNewsPage({
    super.key,
    required this.news,
  });

  @override
  State<OpenTopNewsPage> createState() => _OpenTopNewsPageState();
}

class _OpenTopNewsPageState extends State<OpenTopNewsPage> {
  late YoutubePlayerController youtubePlayerController;

  @override
  void initState() {
    super.initState();
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: widget.news.video,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        hideControls: false,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    youtubePlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: YoutubePlayerBuilder(
          builder: (BuildContext context, Widget player) {
            return SingleChildScrollView(
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
                      widget.news.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: fontFamily,
                      ),
                    ),
                  ),
                  HBox(8.0),
                  if (widget.news.useVideo)
                    if (widget.news.fromYoutube)
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: player,
                        ),
                      )
                    else
                      HBox(0.0)
                  else
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: CachedNetworkImage(
                        width: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: widget.news.banner,
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
                      widget.news.text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: fontFamily2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  HBox(32.0),
                  if (widget.news.source.isNotEmpty)
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
                              widget.news.source,
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
                            "${TimeParser.parse(widget.news.createdTime).date} | ${TimeParser.parse(widget.news.createdTime).time} ",
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
            );
          },
          player: YoutubePlayer(
            controller: youtubePlayerController,
          ),
        ),
      ),
    );
  }
}
