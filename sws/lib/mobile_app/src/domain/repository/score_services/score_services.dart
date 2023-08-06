import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/match_event_model/match.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/standing_model/standing.dart';
import 'package:sws/mobile_app/src/domain/repository/score_services/score_services_functions.dart';
import 'package:sws/mobile_app/src/utils/constants/score_sources.dart';

class ScoreServices extends ScoreServicesFunctions {
  static final dio = Dio();

  @override
  Future getComments(String id, String scoreKEY) {
    // TODO: implement getComments
    throw UnimplementedError();
  }

  @override
  Future getCompetitions(String id, String scoreKEY) async {
    final result =
        await dio.get(ScoreRequestURLs.getCompetitions(id, scoreKEY));
    return result.data;
  }

  @override
  Future getCountries() async {
    final result = await dio.get(ScoreRequestURLs.getCountries(''));
    return result;
  }

  @override
  Future<List<MatchEvent>> getEvents(String id, String scoreKEY) async {
    List<MatchEvent> events = [];
    final result = await dio.get(ScoreRequestURLs.getEvents(id, scoreKEY));
    for (var item in result.data) {
      try {
        events.add(MatchEvent.fromJson(item));
      } catch (e) {
        log("Error in EVENT_SERVICES * ", error: e);
      }
    }

    return events;
  }

  @override
  Future getHeadToHead(String id, String scoreKEY) {
    // TODO: implement getHeadToHead
    throw UnimplementedError();
  }

  @override
  Future getLineups(String id, String scoreKEY) {
    // TODO: implement getLineups
    throw UnimplementedError();
  }

  @override
  Future getPlayers(String id, String scoreKEY) {
    // TODO: implement getPlayers
    throw UnimplementedError();
  }

  @override
  Future<List<Standing>> getStandings(String id, String scoreKEY) async {
    final result = await dio.get(ScoreRequestURLs.getStandings(id, scoreKEY));
    List<Standing> standings = [];

    for (final res in result.data) {
      try {
        standings.add(Standing.fromJson(res));
      } catch (e) {
        log("$e");
      }
    }

    return standings;
  }

  Future testStanding(String id) async {
    final result = await dio.get(ScoreRequestURLs.getStandings('', ''));
    return result.data;
  }

  @override
  Future getStats(String id, String scoreKEY) {
    // TODO: implement getStats
    throw UnimplementedError();
  }

  @override
  Future getTeams(String id, String scoreKEY) async {
    final result = await dio.get(ScoreRequestURLs.getTeams(id, scoreKEY));
    return result;
  }

  @override
  Future getWebsockets(String id, String scoreKEY) {
    // TODO: implement getWebsockets
    throw UnimplementedError();
  }
}
