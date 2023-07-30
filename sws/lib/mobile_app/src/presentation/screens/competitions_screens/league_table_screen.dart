import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sws/mobile_app/src/presentation/providers/soccer_providers.dart';
import 'package:sws/mobile_app/src/presentation/screens/competitions_screens/club_standings_names_screen.dart';
import 'package:sws/mobile_app/src/presentation/screens/competitions_screens/club_standings_screen.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/error_screen.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/loading_screen.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/sized_box.dart';

class LeagueTableScreen extends HookConsumerWidget {
  final String id;

  const LeagueTableScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, ref) {
    final standingPr = ref.watch(getStandingProvider(id));
    return Scaffold(
      body: standingPr.when(
        data: (data) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: Column(
                      children: [
                        HBox(8.0),
                        const ClubStandingStatsNameScreen(),
                        ...List<Widget>.generate(data.length, (index) {
                          return ClubStandingScreen(
                            standing: data[index],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        error: (e, m) {
          log("Error: $e", error: e, stackTrace: m);
          return const AppError();
        },
        loading: () {
          return const AppLoading();
        },
      ),
    );
  }
}
