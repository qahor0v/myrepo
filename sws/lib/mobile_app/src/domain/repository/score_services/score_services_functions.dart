import 'package:sws/mobile_app/src/domain/models/score_models/match_event_model/match.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/standing_model/standing.dart';

abstract class ScoreServicesFunctions {
  Future<dynamic> getCountries();

  Future<dynamic> getCompetitions(String id);

  Future<dynamic> getTeams(String id);

  Future<dynamic> getPlayers(String id);

  Future<List<Standing>> getStandings(String id);

  Future<List<MatchEvent>> getEvents(String id);

  Future<dynamic> getLineups(String id);

  Future<dynamic> getStats(String id);

  Future<dynamic> getComments(String id);

  Future<dynamic> getHeadToHead(String id);

  Future<dynamic> getWebsockets(String id);
}
