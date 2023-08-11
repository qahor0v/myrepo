import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:sws/mobile_app/src/config/router/navigator.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/match_event_model/match.dart';
import 'package:sws/mobile_app/src/presentation/screens/competitions_screens/open_match_page.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/mobile_app/src/utils/extensions/match_status.dart';
import 'package:sws/mobile_app/src/utils/extensions/time_parsers.dart';

class MatchEventScreen extends StatelessWidget {
  final MatchEvent event;

  const MatchEventScreen({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        go(context, OpenMatchPage(event: event));
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 12,
          bottom: 12,
        ),
        margin: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8.0,
        ),
        decoration: BoxDecoration(
          color: kDarkColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: event.team_home_badge,
                        height: 60,
                        width: 60,
                      ),
                      HBox(12.0),
                      Text(
                        event.match_hometeam_name.trim(),
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                WBox(16.0),
                Column(
                  children: [
                    matchStatus(event.match_status).code == 1
                        ? matchStatus(event.match_status).title.length != 1
                            ? Container(
                                margin: const EdgeInsets.only(
                                  bottom: 8.0,
                                  top: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green.shade600,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: const EdgeInsets.only(
                                  left: 12,
                                  right: 12,
                                  top: 4,
                                  bottom: 4,
                                ),
                                child: Text(
                                  matchStatus(event.match_status).title,
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink()
                        : const SizedBox.shrink(),
                    Text(
                      event.match_awayteam_ft_score == ""
                          ? "VS"
                          : "${event.match_hometeam_ft_score} : ${event.match_awayteam_ft_score}",
                      style: GoogleFonts.ubuntu(
                        color: mainColor,
                        fontSize: 32,
                      ),
                    ),
                    matchStatus(event.match_status).code == 100 ||
                            matchStatus(event.match_status).code == 0
                        ? Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                            ),
                            child: Text(
                              matchStatus(event.match_status).title,
                              style: GoogleFonts.robotoMono(
                                color: Colors.greenAccent,
                                fontSize: 12,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    event.match_status.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  IconlyLight.time_circle,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                WBox(4.0),
                                Text(
                                  TimeParser.toLocal(event.match_time),
                                  style: GoogleFonts.robotoMono(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : HBox(0.0),
                    event.match_status.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
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
                                ),
                              ],
                            ),
                          )
                        : HBox(0.0),
                  ],
                ),
                WBox(16.0),
                Expanded(
                  child: Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: event.team_away_badge,
                        height: 60,
                        width: 60,
                      ),
                      HBox(12.0),
                      Text(
                        event.match_awayteam_name.trim(),
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
