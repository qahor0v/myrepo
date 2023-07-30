import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/match_event_model/match.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/standing_model/standing.dart';
import 'package:sws/mobile_app/src/domain/repository/score_services/score_services.dart';
import 'package:sws/mobile_app/src/utils/constants/score_sources.dart';

final getStandingProvider = FutureProvider.family((ref, String id) async {
  List<Standing> result = await ScoreServices().getStandings(id);

  return result;
});

final getEventsProvider = FutureProvider.family((ref, String id) async {
  List<MatchEvent> result = await ScoreServices().getEvents(id);

  return result;
});

final getAllEventsProvider = FutureProvider((ref) async {
  List<MatchEvent> events = [];

  for (Turnir turnir in Turnir.all) {
    try {
      List<MatchEvent> result = await ScoreServices().getEvents(turnir.id);
      events.addAll(result);
    } catch (e) {
      log("Error - GET ALL EVENTS PROVIDER* ", error: e);
    }
  }

  return events;
});
