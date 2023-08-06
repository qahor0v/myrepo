import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/match_event_model/match.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/standing_model/standing.dart';
import 'package:sws/mobile_app/src/domain/repository/score_services/score_services.dart';
import 'package:sws/mobile_app/src/presentation/providers/key_provider.dart';
import 'package:sws/mobile_app/src/utils/constants/score_sources.dart';

final getStandingProvider = FutureProvider.family((ref, String id) async {
  final key = ref.watch(keyProvider)!.key;
  List<Standing> result = await ScoreServices().getStandings(id, key);

  return result;
});

final getEventsProvider = FutureProvider.family((ref, String id) async {
  final key = ref.watch(keyProvider)!.key;
  List<MatchEvent> result = await ScoreServices().getEvents(id, key);

  return result;
});

final getAllEventsProvider = FutureProvider((ref) async {
  final key = ref.watch(keyProvider)!.key;
  List<MatchEvent> events = [];

  for (Turnir turnir in Turnir.all) {
    try {
      List<MatchEvent> result = await ScoreServices().getEvents(turnir.id, key);
      events.addAll(result);
    } catch (e) {
      log("Error - GET ALL EVENTS PROVIDER* ", error: e);
    }
  }

  return events;
});

final getAllMatchesProvider = FutureProvider.family((
  ref,
  ValueNotifier<List<MatchEvent>> eventsHelper,
) async {
  List<MatchEvent> events = [];

  final key = ref.watch(keyProvider)!.key;
  for (Turnir turnir in Turnir.all) {
    try {
      List<MatchEvent> result = await ScoreServices().getEvents(turnir.id, key);
      events.addAll(result);
      eventsHelper.value.addAll(result);
    } catch (e) {
      log("Error - GET ALL EVENTS PROVIDER* ", error: e);
    }
  }
  return events;
});
