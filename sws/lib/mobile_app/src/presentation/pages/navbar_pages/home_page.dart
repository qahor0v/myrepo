import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/match_event_model/match.dart';
import 'package:sws/mobile_app/src/domain/repository/score_services/score_services.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/mobile_app/src/presentation/screens/home_screens/category_button_widget.dart';
import 'package:sws/mobile_app/src/presentation/screens/home_screens/home_news_widget.dart';
import 'package:sws/mobile_app/src/presentation/screens/home_screens/home_video_widget.dart';
import 'package:sws/mobile_app/src/presentation/screens/home_screens/match_widget.dart';
import 'package:sws/mobile_app/src/presentation/screens/home_screens/slider_screen.dart';
import 'package:sws/mobile_app/src/utils/constants/score_sources.dart';

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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: const Text(
          "LiveScore",
          style: TextStyle(
            color: mainColor,
            fontSize: 29,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              IconlyLight.notification,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              IconlyLight.setting,
              color: Colors.white,
            ),
            onPressed: () async {
              log("Starting...");
              await ScoreServices().getCompetitions(ScoreIDs.ger).then((value) {
                log("Result: $value");
              });
              log("Finished.");
            },
          ),
        ],
      ),
      body: Padding(
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
            ),
            const HomeNewsWidget(),
            HomeCategoryButtonWidget(
              onTap: () {},
              title: "Tomosha qiling!",
            ),
            const HomeVideoWidget(),
            SBox(100),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
