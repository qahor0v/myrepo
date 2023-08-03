import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:sws/mobile_app/src/config/themes/fonts.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/match_event_model/match.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/mobile_app/src/presentation/screens/shimmers/app_shimmer.dart';
import 'package:sws/mobile_app/src/utils/constants/asset_icons.dart';
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
                      color: Colors.greenAccent,
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
                        color: Colors.greenAccent,
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
                        color: Colors.greenAccent,
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
                      Text(
                        event.match_stadium,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily: fontFamily,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
