// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/config/themes/fonts.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/match_event_model/match.dart';
import 'package:sws/mobile_app/src/presentation/providers/soccer_providers.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/mobile_app/src/presentation/screens/home_screens/category_button_widget.dart';
import 'package:sws/mobile_app/src/presentation/screens/home_screens/home_news_widget.dart';
import 'package:sws/mobile_app/src/presentation/screens/home_screens/home_video_widget.dart';
import 'package:sws/mobile_app/src/presentation/screens/home_screens/match_widget.dart';
import 'package:sws/mobile_app/src/presentation/screens/home_screens/slider_screen.dart';

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
          "Silk Way Sport",
          style: TextStyle(
            color: mainColor,
            fontSize: 22,
            fontWeight: FontWeight.w800,
            fontFamily: fontFamily,
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
