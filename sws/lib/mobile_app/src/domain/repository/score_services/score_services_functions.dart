import 'package:sws/mobile_app/src/domain/models/score_models/match_event_model/match.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/standing_model/standing.dart';

abstract class ScoreServicesFunctions {
  Future<dynamic> getCountries();

  Future<dynamic> getCompetitions(String id, String scoreKEY);

  Future<dynamic> getTeams(String id, String scoreKEY);

  Future<dynamic> getPlayers(String id, String scoreKEY);

  Future<List<Standing>> getStandings(String id, String scoreKEY);

  Future<List<MatchEvent>> getEvents(String id, String scoreKEY);

  Future<dynamic> getLineups(String id, String scoreKEY);

  Future<dynamic> getStats(String id, String scoreKEY);

  Future<dynamic> getComments(String id, String scoreKEY);

  Future<dynamic> getHeadToHead(String id, String scoreKEY);

  Future<dynamic> getWebsockets(String id, String scoreKEY);
}
