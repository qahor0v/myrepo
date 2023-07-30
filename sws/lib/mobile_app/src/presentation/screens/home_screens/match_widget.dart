import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sws/mobile_app/src/config/router/navigator.dart';
import 'package:sws/mobile_app/src/config/themes/app_colors.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/match_event_model/match.dart';
import 'package:sws/mobile_app/src/domain/repository/score_services/score_services.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/back_button.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';
import 'package:sws/mobile_app/src/utils/constants/score_sources.dart';
import 'package:sws/mobile_app/src/utils/extensions/match_status.dart';
import 'package:sws/mobile_app/src/utils/extensions/time_parsers.dart';

class HomeMatchWidget extends StatefulHookConsumerWidget {
  final ValueNotifier<List<MatchEvent>> eventsHelper;

  const HomeMatchWidget({
    super.key,
    required this.eventsHelper,
  });

  @override
  ConsumerState<HomeMatchWidget> createState() => _HomeMatchWidgetState();
}

class _HomeMatchWidgetState extends ConsumerState<HomeMatchWidget> {
  List<MatchEvent> events = [];
  bool isLoading = true;

  void getData() async {
    for (Turnir turnir in Turnir.all) {
      try {
        List<MatchEvent> result = await ScoreServices().getEvents(turnir.id);
        setState(() {
          events.addAll(result);
        });
      } catch (e) {
        log("Error - GET ALL EVENTS PROVIDER* ", error: e);
      }
    }

    setState(() {
      isLoading = false;
    });
    widget.eventsHelper.value.addAll(events);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: 6,
          (context, index) {
            return Container(
              margin: EdgeInsets.only(
                top: index == 0 ? 24 : 8.0,
                bottom: 8.0,
              ),
              //padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: kDarkColor,
              ),
              height: 72,
              width: double.infinity,
              child: Shimmer.fromColors(
                baseColor: baseColor,
                highlightColor: highlightColor,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      );
    } else {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: events.length > 8 ? 8 : events.length,
          (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 8),
                child: Row(
                  children: [
                    Text(
                      "O'yinlar",
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        go(context, OpenAllMatchesPage(events: events));
                      },
                      child: Row(
                        children: [
                          Text(
                            "Barchasi",
                            style: GoogleFonts.lato(
                              color: mainColor,
                              fontSize: 18,
                            ),
                          ),
                          WBox(4.0),
                          const Icon(
                            Icons.navigate_next_sharp,
                            color: mainColor,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else {
              final event = events[index - 1];
              return Container(
                margin: const EdgeInsets.only(
                  top: 4.0,
                  bottom: 8.0,
                ),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: kDarkColor,
                ),
                //height: 72,
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WBox(8.0),
                        Expanded(
                          child: Text(
                            event.league_name,
                            style: GoogleFonts.robotoMono(
                              color: mainColor,
                              fontSize: 14,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        WBox(16.0),
                        if (event.match_status.isEmpty)
                          Row(
                            children: [
                              const Icon(
                                IconlyLight.calendar,
                                color: Colors.grey,
                                size: 20,
                              ),
                              WBox(4.0),
                              Text(
                                "${event.match_date} | ${TimeParser.toLocal(event.match_time)}",
                                style: GoogleFonts.robotoMono(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                                maxLines: 1,
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
                        WBox(8.0),
                      ],
                    ),
                    HBox(8.0),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  event.match_hometeam_name,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: GoogleFonts.heebo(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              WBox(8.0),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: CachedNetworkImage(
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                  imageUrl: event.team_home_badge,
                                ),
                              ),
                            ],
                          ),
                        ),
                        WBox(12.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Text(
                            //   "24.08.2023",
                            //   style: GoogleFonts.poppins(
                            //     color: Colors.white,
                            //   ),
                            // ),

                            if (event.match_hometeam_ft_score.isEmpty)
                              Text(
                                "VS",
                                style: GoogleFonts.oswald(
                                    color: mainColor, fontSize: 22),
                              )
                            else
                              Text(
                                "${event.match_hometeam_ft_score} : ${event.match_awayteam_ft_score}",
                                style: GoogleFonts.oswald(
                                    color: mainColor, fontSize: 22),
                              ),
                          ],
                        ),
                        WBox(12.0),
                        Expanded(
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: CachedNetworkImage(
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                  imageUrl: event.team_away_badge,
                                ),
                              ),
                              WBox(8.0),
                              Expanded(
                                child: Text(
                                  event.match_awayteam_name,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: GoogleFonts.heebo(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
      );
    }
  }
}

class OpenAllMatchesPage extends StatelessWidget {
  final List<MatchEvent> events;

  const OpenAllMatchesPage({
    super.key,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        backgroundColor: Colors.black,
        title: Text(
          "Barcha o'yinlar",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SBox(8.0),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: events.length,
              (context, index) {
                final event = events[index];
                return Container(
                  margin: const EdgeInsets.only(
                    top: 4.0,
                    bottom: 8.0,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: kDarkColor,
                  ),
                  //height: 72,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WBox(8.0),
                          Expanded(
                            child: Text(
                              event.league_name,
                              style: GoogleFonts.robotoMono(
                                color: mainColor,
                                fontSize: 14,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          WBox(16.0),
                          if (event.match_status.isEmpty)
                            Row(
                              children: [
                                const Icon(
                                  IconlyLight.calendar,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                WBox(4.0),
                                Text(
                                  "${event.match_date} | ${TimeParser.toLocal(event.match_time)}",
                                  style: GoogleFonts.robotoMono(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                  maxLines: 1,
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
                          WBox(8.0),
                        ],
                      ),
                      HBox(8.0),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    event.match_hometeam_name,
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: GoogleFonts.heebo(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                WBox(8.0),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: CachedNetworkImage(
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.cover,
                                    imageUrl: event.team_home_badge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          WBox(12.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              if (event.match_hometeam_ft_score.isEmpty)
                                Text(
                                  "VS",
                                  style: GoogleFonts.oswald(
                                      color: mainColor, fontSize: 22),
                                )
                              else
                                Text(
                                  "${event.match_hometeam_ft_score} : ${event.match_awayteam_ft_score}",
                                  style: GoogleFonts.oswald(
                                      color: mainColor, fontSize: 22),
                                ),
                            ],
                          ),
                          WBox(12.0),
                          Expanded(
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: CachedNetworkImage(
                                    height: 40,
                                    width: 40,
                                    fit: BoxFit.cover,
                                    imageUrl: event.team_away_badge,
                                  ),
                                ),
                                WBox(8.0),
                                Expanded(
                                  child: Text(
                                    event.match_awayteam_name,
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: GoogleFonts.heebo(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SBox(8.0),
        ],
      ),
    );
  }
}