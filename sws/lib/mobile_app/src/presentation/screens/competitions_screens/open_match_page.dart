import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/config/themes/fonts.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/match_event_model/match.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/mobile_app/src/presentation/screens/shimmers/app_shimmer.dart';
import 'package:sws/mobile_app/src/utils/constants/asset_icons.dart';
import 'package:sws/mobile_app/src/utils/constants/asset_paths.dart';
import 'package:sws/mobile_app/src/utils/extensions/match_status.dart';
import 'package:sws/mobile_app/src/utils/extensions/time_parsers.dart';

class OpenMatchPage extends HookConsumerWidget {
  final MatchEvent event;

  const OpenMatchPage({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context, ref) {
    final tabIndex = useState(0);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HBox(16.0),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                              imageUrl: event.team_home_badge,
                              height: 100,
                              width: 100,
                              errorWidget: (c, s, e) {
                                return const ImageIcon(
                                  AssetImage(AssetIcons.ball),
                                  color: Colors.white,
                                  size: 60,
                                );
                              },
                              placeholder: (c, s) {
                                return const AppShimmer();
                              },
                            ),
                          ),
                          HBox(12.0),
                          Text(
                            event.match_hometeam_name.trim(),
                            style: const TextStyle(
                              fontFamily: fontFamily2,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    WBox(16.0),
                    Column(
                      children: [
                        if (event.match_hometeam_score.isNotEmpty)
                          Text(
                            "${event.match_hometeam_score} : ${event.match_awayteam_score}",
                            style: GoogleFonts.roboto(
                              color: mainColor,
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                            ),
                            maxLines: 1,
                          ),
                        if (event.match_status.isEmpty)
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    IconlyLight.calendar,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                  WBox(4.0),
                                  Text(
                                    event.match_date,
                                    style: GoogleFonts.robotoMono(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                              HBox(16.0),
                              Text(
                                "VS",
                                style: GoogleFonts.robotoMono(
                                    color: Colors.greenAccent,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w800),
                                maxLines: 1,
                              ),
                              HBox(16.0),
                              Row(
                                children: [
                                  Icon(
                                    IconlyLight.time_circle,
                                    color: Colors.grey.shade300,
                                    size: 24,
                                  ),
                                  WBox(4.0),
                                  Text(
                                    TimeParser.toLocal(event.match_time),
                                    style: GoogleFonts.robotoMono(
                                      color: Colors.grey.shade300,
                                      fontSize: 14,
                                    ),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        if (matchStatus(event.match_status).code == 100)
                          Text(
                            "Yakunlangan",
                            style: GoogleFonts.robotoMono(
                              color: Colors.greenAccent,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                          ),
                        if (matchStatus(event.match_status).code == 1)
                          Text(
                            event.match_status.length <= 5 &&
                                    event.match_status.isNotEmpty
                                ? "${event.match_status}'"
                                : event.match_status,
                            style: GoogleFonts.robotoMono(
                              color: Colors.greenAccent,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                          ),
                      ],
                    ),
                    WBox(16.0),
                    Expanded(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                              imageUrl: event.team_away_badge,
                              height: 100,
                              width: 100,
                              errorWidget: (c, s, e) {
                                return const ImageIcon(
                                  AssetImage(AssetIcons.ball),
                                  color: Colors.white,
                                  size: 60,
                                );
                              },
                              placeholder: (c, s) {
                                return const AppShimmer();
                              },
                            ),
                          ),
                          HBox(12.0),
                          Text(
                            event.match_awayteam_name.trim(),
                            style: const TextStyle(
                              fontFamily: fontFamily2,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                HBox(24.0),
                Row(
                  children: [
                    const Icon(
                      Icons.tour,
                      color: mainColor,
                    ),
                    WBox(4.0),
                    Text(
                      "${event.league_name} | ${event.match_round} - tur",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        fontFamily: fontFamily,
                      ),
                    ),
                  ],
                ),
                if (event.match_referee.isNotEmpty) HBox(16.0),
                if (event.match_referee.isNotEmpty)
                  Row(
                    children: [
                      const Icon(
                        Icons.sports,
                        color: mainColor,
                      ),
                      WBox(4.0),
                      const Text(
                        "Hakam:",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          fontFamily: fontFamily,
                        ),
                      ),
                      WBox(4.0),
                      Text(
                        event.match_referee,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily: fontFamily,
                        ),
                      ),
                    ],
                  ),
                if (event.match_stadium.isNotEmpty) HBox(16.0),
                if (event.match_stadium.isNotEmpty)
                  Row(
                    children: [
                      const Icon(
                        Icons.stadium_outlined,
                        color: mainColor,
                      ),
                      WBox(4.0),
                      const Text(
                        "Maydon",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          fontFamily: fontFamily,
                        ),
                      ),
                      WBox(4.0),
                      Flexible(
                        child: Text(
                          event.match_stadium,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: fontFamily,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                HBox(24.0),
                SizedBox(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CustomTabBarButton(
                          title: "Voqealar",
                          isSelected: tabIndex.value == 0,
                          onTap: () {
                            tabIndex.value = 0;
                          },
                        ),
                        CustomTabBarButton(
                          title: "Statistika",
                          isSelected: tabIndex.value == 1,
                          onTap: () {
                            tabIndex.value = 1;
                          },
                        ),
                        CustomTabBarButton(
                          title: "Tarkiblar",
                          isSelected: tabIndex.value == 2,
                          onTap: () {
                            tabIndex.value = 2;
                          },
                        ),
                        CustomTabBarButton(
                          title: "Videolar",
                          isSelected: tabIndex.value == 3,
                          onTap: () {
                            tabIndex.value = 3;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                HBox(24.0),
                if (tabIndex.value == 0)
                  ...[
                    if (event.goalscorer.isEmpty &&
                        event.cards.isEmpty &&
                        event.substitutions.away.isEmpty &&
                        event.substitutions.home.isEmpty)
                      Lottie.asset(AssetPaths.empty),
                    if (event.goalscorer.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.sports_soccer,
                            color: mainColor,
                          ),
                          WBox(8.0),
                          const Text(
                            "Gollar",
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    HBox(8.0),
                    ...event.goalscorer.map(
                      (e) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 8.0,
                            bottom: 16.0,
                          ),
                          child: Row(
                            mainAxisAlignment: e.home_scorer.isEmpty
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              WBox(32),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${e.time}'",
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontFamily: fontFamily2,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  HBox(4.0),
                                  Text(
                                    e.score.trim(),
                                    style: const TextStyle(
                                      color: mainColor,
                                      fontFamily: fontFamily,
                                      fontSize: 16,
                                    ),
                                  ),
                                  HBox(8.0),
                                  if (e.away_scorer.isNotEmpty)
                                    Text(
                                      e.away_scorer,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: fontFamily2,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  if (e.home_scorer.isNotEmpty)
                                    Text(
                                      e.home_scorer,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: fontFamily2,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  HBox(4.0),
                                  if (e.away_assist.isNotEmpty)
                                    Text(
                                      e.away_assist,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontFamily: fontFamily2,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  if (e.home_assist.isNotEmpty)
                                    Text(
                                      e.home_assist,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontFamily: fontFamily2,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                ],
                              ),
                              WBox(32),
                            ],
                          ),
                        );
                      },
                    ),
                    HBox(24.0),
                    if (event.cards.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.sports,
                            color: mainColor,
                          ),
                          WBox(8.0),
                          const Text(
                            "Ogohlantirishlar / Kartochkalar",
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    HBox(16.0),
                    ...event.cards.map(
                      (e) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 8.0,
                            bottom: 16.0,
                          ),
                          child: Row(
                            mainAxisAlignment: e.home_fault.isEmpty
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              WBox(32),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "${e.time}'",
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontFamily: fontFamily2,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  HBox(8.0),
                                  Container(
                                    height: 24,
                                    width: 16,
                                    color: e.card == "yellow card"
                                        ? Colors.yellow
                                        : Colors.red,
                                  ),
                                  HBox(8.0),
                                  if (e.home_fault.isNotEmpty)
                                    Text(
                                      e.home_fault,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: fontFamily2,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  if (e.away_fault.isNotEmpty)
                                    Text(
                                      e.away_fault,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: fontFamily2,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                ],
                              ),
                              WBox(32),
                            ],
                          ),
                        );
                      },
                    ),
                    HBox(24.0),
                    if (event.substitutions.home.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.change_circle_outlined,
                            color: mainColor,
                          ),
                          WBox(8.0),
                          const Text(
                            "O'zgarishlar",
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    HBox(16.0),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              ...event.substitutions.home.map((e) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Column(
                                    children: [
                                      Text(
                                        "${e.time}'",
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontFamily: fontFamily2,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      HBox(4.0),
                                      Text(
                                        e.substitution,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: fontFamily,
                                          fontSize: 13,
                                        ),
                                      ),
                                      HBox(8.0),
                                    ],
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                        WBox(24.0),
                        Expanded(
                          child: Column(
                            children: [
                              ...event.substitutions.away.map((e) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Column(
                                    children: [
                                      Text(
                                        "${e.time}'",
                                        style: const TextStyle(
                                          color: Colors.white70,
                                          fontFamily: fontFamily2,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      HBox(4.0),
                                      Text(
                                        e.substitution,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: fontFamily,
                                          fontSize: 13,
                                        ),
                                      ),
                                      HBox(8.0),
                                    ],
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ].map((e) => e)
                else if (tabIndex.value == 1)
                  if (event.statistics.isNotEmpty)
                    ...event.statistics.map((e) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          children: [
                            Text(
                              e.home,
                              style: const TextStyle(
                                color: mainColor,
                                fontSize: 16,
                                fontFamily: fontFamily,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              e.type,
                              style: GoogleFonts.ubuntu(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              e.away,
                              style: const TextStyle(
                                color: mainColor,
                                fontSize: 16,
                                fontFamily: fontFamily,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      );
                    })
                  else
                    Lottie.asset(AssetPaths.empty)
                else if (tabIndex.value == 2)
                  if (event.lineup.home.starting_lineups.isNotEmpty &&
                      event.lineup.away.starting_lineups.isNotEmpty)
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (event.lineup.home.starting_lineups.isNotEmpty)
                                Text(
                                  "Asosiy tarkib",
                                  style: GoogleFonts.roboto(
                                    color: mainColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              if (event.lineup.home.starting_lineups.isNotEmpty)
                                HBox(8.0),
                              if (event.lineup.home.starting_lineups.isNotEmpty)
                                ...event.lineup.home.starting_lineups.map((e) {
                                  return Text(
                                    "${e.lineup_number}.${e.lineup_player}",
                                    style:
                                        GoogleFonts.roboto(color: Colors.white),
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                  );
                                }),
                              if (event.lineup.home.starting_lineups.isNotEmpty)
                                HBox(16.0),
                              if (event.lineup.home.coach.isNotEmpty)
                                Text(
                                  "Murabbiy",
                                  style: GoogleFonts.roboto(
                                    color: mainColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              if (event.lineup.home.coach.isNotEmpty) HBox(8.0),
                              if (event.lineup.home.coach.isNotEmpty)
                                ...event.lineup.home.coach.map((e) {
                                  return Text(
                                    e.lineup_player,
                                    style:
                                        GoogleFonts.roboto(color: Colors.white),
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                  );
                                }),
                              if (event.lineup.home.coach.isNotEmpty)
                                HBox(16.0),
                              if (event.lineup.home.substitutes.isNotEmpty)
                                Text(
                                  "Zaxiradagilar",
                                  style: GoogleFonts.roboto(
                                    color: mainColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              if (event.lineup.home.substitutes.isNotEmpty)
                                HBox(8.0),
                              if (event.lineup.home.substitutes.isNotEmpty)
                                ...event.lineup.home.substitutes.map((e) {
                                  return Text(
                                    "${e.lineup_number}.${e.lineup_player}",
                                    style:
                                        GoogleFonts.roboto(color: Colors.white),
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                  );
                                }),
                            ],
                          ),
                        ),
                        WBox(24.0),
                        Expanded(
                          child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (event.lineup.away.starting_lineups.isNotEmpty)
                                Text(
                                  "Asosiy tarkib",
                                  style: GoogleFonts.roboto(
                                    color: mainColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              if (event.lineup.away.starting_lineups.isNotEmpty)
                                HBox(8.0),
                              if (event.lineup.away.starting_lineups.isNotEmpty)
                                ...event.lineup.away.starting_lineups.map((e) {
                                  return Text(
                                    "${e.lineup_number}.${e.lineup_player}",
                                    style:
                                        GoogleFonts.roboto(color: Colors.white),
                                    maxLines: 1,
                                    textAlign: TextAlign.right,
                                  );
                                }),
                              if (event.lineup.away.starting_lineups.isNotEmpty)
                                HBox(16.0),
                              if (event.lineup.away.coach.isNotEmpty)
                                Text(
                                  "Murabbiy",
                                  style: GoogleFonts.roboto(
                                    color: mainColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              if (event.lineup.away.coach.isNotEmpty) HBox(8.0),
                              if (event.lineup.away.coach.isNotEmpty)
                                ...event.lineup.away.coach.map((e) {
                                  return Text(
                                    e.lineup_player,
                                    style:
                                        GoogleFonts.roboto(color: Colors.white),
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                  );
                                }),
                              if (event.lineup.away.coach.isNotEmpty)
                                HBox(16.0),
                              if (event.lineup.away.substitutes.isNotEmpty)
                                Text(
                                  "Zaxiradagilar",
                                  style: GoogleFonts.roboto(
                                    color: mainColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              if (event.lineup.away.substitutes.isNotEmpty)
                                HBox(8.0),
                              if (event.lineup.away.substitutes.isNotEmpty)
                                ...event.lineup.away.substitutes.map((e) {
                                  return Text(
                                    "${e.lineup_number}.${e.lineup_player}",
                                    style:
                                        GoogleFonts.roboto(color: Colors.white),
                                    maxLines: 1,
                                    textAlign: TextAlign.right,
                                  );
                                }),
 
                             ],
                          ),
                        )
                      ],
                    )
                  else
                    Lottie.asset(AssetPaths.empty)
                else
                  Lottie.asset(AssetPaths.empty),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTabBarButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final void Function() onTap;

  const CustomTabBarButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.only(right: 8.0),
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 4,
          bottom: 4,
        ),
        decoration: BoxDecoration(
          color: isSelected ? mainColor : Colors.black,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: mainColor),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.black : mainColor,
            fontSize: 15,
            fontWeight: FontWeight.w700,
            fontFamily: fontFamily2,
          ),
        ),
      ),
    );
  }
}
