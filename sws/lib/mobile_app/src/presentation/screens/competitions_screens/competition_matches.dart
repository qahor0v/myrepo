import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sws/mobile_app/src/presentation/providers/soccer_providers.dart';
import 'package:sws/mobile_app/src/presentation/screens/competitions_screens/match_event_screen.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/error_screen.dart';
import 'package:sws/mobile_app/src/presentation/screens/helpers/loading_screen.dart';

class CompetitionEvents extends HookConsumerWidget {
  final String id;

  const CompetitionEvents({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, ref) {
    final eventsProvider = ref.watch(getEventsProvider(id));
    return Scaffold(
      body: eventsProvider.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return MatchEventScreen(event: data[index]);
            },
          );
        },
        error: (e, m) {
          log("Error GET_MATCHES_PAGE* ", error: e, stackTrace: m);
          return const AppError();
        },
        loading: () {
          return const AppLoading();
        },
      ),
    );
  }
}
