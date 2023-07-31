import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:image_network/image_network.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/config/themes/fonts.dart';
import 'package:sws/mobile_app/src/presentation/providers/soccer_providers.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/error_screen.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/loading_screen.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/mobile_app/src/presentation/screens/shimmers/app_shimmer.dart';
import 'package:sws/mobile_app/src/utils/extensions/match_status.dart';
import 'package:sws/mobile_app/src/utils/extensions/time_parsers.dart';
import 'package:sws/web_app/src/presentation/widgets/focused_wrapper.dart';

class WebHomeMatchWidget extends HookConsumerWidget {
  const WebHomeMatchWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final getter = ref.watch(getAllEventsProvider);
    return SliverToBoxAdapter(
      child: getter.when(
        data: (data) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List<Widget>.generate(
                        (data.length - data.length ~/ 2) > 4
                            ? 4
                            : (data.length - data.length ~/ 2), (index) {
                      final event = data[index];
                      return FocusedWrapper(
                        onTap: () {},
                        child: (focused) {
                          return AnimatedScale(
                            scale: focused ? 1.05 : 1.0,
                            duration: const Duration(milliseconds: 300),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: focused ? darkColor : kDarkColor,
                              ),
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                                top: 8,
                                bottom: 8,
                              ),
                              margin: const EdgeInsets.only(top: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            event.match_hometeam_name.trim(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: fontFamily2,
                                            ),
                                            maxLines: 1,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                        WBox(8.0),
                                        ClipRRect(
                                          child: ImageNetwork(
                                            image: event.team_home_badge,
                                            height: 30,
                                            width: 30,
                                            onError: const Icon(
                                              Icons.sports_soccer,
                                              color: Colors.white,
                                            ),
                                            onLoading: const AppShimmer(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  WBox(12.0),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      HBox(4.0),
                                      if (event.match_status.isEmpty)
                                        Row(
                                          children: [
                                            const Icon(
                                              IconlyLight.time_circle,
                                              color: Colors.grey,
                                              size: 20,
                                            ),
                                            WBox(2.0),
                                            Text(
                                              TimeParser.toLocal(
                                                  event.match_time),
                                              style: const TextStyle(
                                                fontFamily: fontFamily,
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (event.match_status.isEmpty) HBox(4.0),
                                      if (event.match_status.isEmpty)
                                        const Text(
                                          "VS",
                                          style: TextStyle(
                                            color: mainColor,
                                            fontFamily: fontFamily,
                                          ),
                                        ),
                                      if (matchStatus(event.match_status)
                                              .code ==
                                          100)
                                        Text(
                                          "${event.match_hometeam_ft_score} : ${event.match_awayteam_ft_score}",
                                          style: const TextStyle(
                                            color: mainColor,
                                            fontFamily: fontFamily,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                          ),
                                        ),
                                      if (matchStatus(event.match_status)
                                              .code ==
                                          100)
                                        HBox(4.0),
                                      if (matchStatus(event.match_status)
                                              .code ==
                                          100)
                                        const Text(
                                          "Yakunlangan",
                                          style: TextStyle(
                                            color: Colors.greenAccent,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontFamily,
                                          ),
                                        ),
                                      if (matchStatus(event.match_status)
                                              .code ==
                                          1)
                                        Text(
                                          "${event.match_status}'",
                                          style: const TextStyle(
                                            color: Colors.greenAccent,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontFamily,
                                          ),
                                        ),
                                      HBox(4.0),
                                    ],
                                  ),
                                  WBox(12.0),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          child: ImageNetwork(
                                            image: event.team_away_badge,
                                            height: 30,
                                            width: 30,
                                            onError: const Icon(
                                              Icons.sports_soccer,
                                              color: Colors.white,
                                            ),
                                            onLoading: const AppShimmer(),
                                          ),
                                        ),
                                        WBox(8.0),
                                        Flexible(
                                          child: Text(
                                            event.match_awayteam_name.trim(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: fontFamily2,
                                            ),
                                            maxLines: 1,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  )),
                  WBox(16.0),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        (data.length ~/ 2) > 4 ? 4 : data.length ~/ 2, (index) {
                      final event = data[data.length ~/ 2 + index];
                      return FocusedWrapper(
                        onTap: () {},
                        child: (focused) {
                          return AnimatedScale(
                            scale: focused ? 1.05 : 1.0,
                            duration: const Duration(milliseconds: 300),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: focused ? darkColor : kDarkColor,
                              ),
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                                top: 8,
                                bottom: 8,
                              ),
                              margin: const EdgeInsets.only(top: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            event.match_hometeam_name.trim(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: fontFamily2,
                                            ),
                                            maxLines: 1,
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                        WBox(8.0),
                                        ClipRRect(
                                          child: ImageNetwork(
                                            image: event.team_home_badge,
                                            height: 30,
                                            width: 30,
                                            onError: const Icon(
                                              Icons.sports_soccer,
                                              color: Colors.white,
                                            ),
                                            onLoading: const AppShimmer(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  WBox(12.0),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      HBox(4.0),
                                      if (event.match_status.isEmpty)
                                        Row(
                                          children: [
                                            const Icon(
                                              IconlyLight.time_circle,
                                              color: Colors.grey,
                                              size: 20,
                                            ),
                                            WBox(2.0),
                                            Text(
                                              TimeParser.toLocal(
                                                  event.match_time),
                                              style: const TextStyle(
                                                fontFamily: fontFamily,
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (event.match_status.isEmpty) HBox(4.0),
                                      if (event.match_status.isEmpty)
                                        const Text(
                                          "VS",
                                          style: TextStyle(
                                            color: mainColor,
                                            fontFamily: fontFamily,
                                          ),
                                        ),
                                      if (matchStatus(event.match_status)
                                              .code ==
                                          100)
                                        Text(
                                          "${event.match_hometeam_ft_score} : ${event.match_awayteam_ft_score}",
                                          style: const TextStyle(
                                            color: mainColor,
                                            fontFamily: fontFamily,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                          ),
                                        ),
                                      if (matchStatus(event.match_status)
                                              .code ==
                                          100)
                                        HBox(4.0),
                                      if (matchStatus(event.match_status)
                                              .code ==
                                          100)
                                        const Text(
                                          "Yakunlangan",
                                          style: TextStyle(
                                            color: Colors.greenAccent,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontFamily,
                                          ),
                                        ),
                                      if (matchStatus(event.match_status)
                                              .code ==
                                          1)
                                        Text(
                                          "${event.match_status}'",
                                          style: const TextStyle(
                                            color: Colors.greenAccent,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: fontFamily,
                                          ),
                                        ),
                                      HBox(4.0),
                                    ],
                                  ),
                                  WBox(12.0),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          child: ImageNetwork(
                                            image: event.team_away_badge,
                                            height: 30,
                                            width: 30,
                                            onError: const Icon(
                                              Icons.sports_soccer,
                                              color: Colors.white,
                                            ),
                                            onLoading: const AppShimmer(),
                                          ),
                                        ),
                                        WBox(8.0),
                                        Flexible(
                                          child: Text(
                                            event.match_awayteam_name.trim(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: fontFamily2,
                                            ),
                                            maxLines: 1,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ))
                ],
              ),
              if (data.length > 8) HBox(16.0),
              if (data.length > 8)
                FocusedWrapper(
                  child: (focused) {
                    return AnimatedScale(
                      scale: focused ? 1.03 : 1.0,
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: focused ? darkColor : kDarkColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Barcha o'yinlar (${data.length})",
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: fontFamily,
                              ),
                            ),
                            WBox(8.0),
                            const Icon(
                              IconlyLight.arrow_right_2,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
            ],
          );
        },
        error: (e, m) {
          return const AppError();
        },
        loading: () {
          return const AppLoading();
        },
      ),
    );
  }
}
