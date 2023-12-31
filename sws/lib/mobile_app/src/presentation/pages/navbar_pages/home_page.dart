// ignore_for_file: unused_result
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/config/themes/fonts.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/match_event_model/match.dart';
import 'package:sws/mobile_app/src/presentation/providers/key_provider.dart';
import 'package:sws/mobile_app/src/presentation/providers/news_providers.dart';
import 'package:sws/mobile_app/src/presentation/providers/soccer_providers.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/mobile_app/src/presentation/screens/home_screens/category_button_widget.dart';
import 'package:sws/mobile_app/src/presentation/screens/home_screens/home_news_widget.dart';
import 'package:sws/mobile_app/src/presentation/screens/home_screens/home_video_widget.dart';
import 'package:sws/mobile_app/src/presentation/screens/home_screens/match_widget.dart';
import 'package:sws/mobile_app/src/presentation/screens/home_screens/more_bottom_sheet.dart';
import 'package:sws/mobile_app/src/presentation/screens/home_screens/slider_screen.dart';

class HomePage extends StatefulHookConsumerWidget {
  final void Function() goVideos;
  final void Function() goNews;

  const HomePage({
    super.key,
    required this.goNews,
    required this.goVideos,
  });

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
              homeMore(context, ref.watch(keyProvider)!.url);
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
          ref.refresh(getTopNewsProvider);
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
                onTap: widget.goNews,
                title: "So'nggi yangiliklar",
                videosProvider: newsProvider,
              ),
              HomeNewsWidget(videosProvider: newsProvider),
              HomeCategoryButtonWidget(
                onTap: widget.goVideos,
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
