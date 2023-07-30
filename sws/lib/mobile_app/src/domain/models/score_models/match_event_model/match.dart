// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/card/c.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/goal_scorer/gs.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/lineups/lup.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/stats/stats.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/subtitutions/stt.dart';

part 'match.freezed.dart';

part 'match.g.dart';

@freezed
class MatchEvent with _$MatchEvent {
  const factory MatchEvent({
    required String match_id,
    required String country_id,
    required String country_name,
    required String league_id,
    required String league_name,
    required String match_date,
    required String match_status,
    required String match_time,
    required String match_hometeam_id,
    required String match_hometeam_name,
    required String match_hometeam_score,
    required String match_awayteam_name,
    required String match_awayteam_id,
    required String match_awayteam_score,
    required String match_hometeam_halftime_score,
    required String match_awayteam_halftime_score,
    required String match_hometeam_extra_score,
    required String match_awayteam_extra_score,
    required String match_hometeam_penalty_score,
    required String match_awayteam_penalty_score,
    required String match_hometeam_ft_score,
    required String match_awayteam_ft_score,
    required String match_hometeam_system,
    required String match_awayteam_system,
    required String match_live,
    required String match_round,
    required String match_stadium,
    required String match_referee,
    required String team_home_badge,
    required String team_away_badge,
    required String league_logo,
    required String country_logo,
    required String league_year,
    required String fk_stage_key,
    required String stage_name,
    required List<GoalScorer> goalscorer,
    required List<Card>cards,
    required SubsTT substitutions,
    required Lineups lineup,
    required List<Stats> statistics,
  }) = _MatchEvent;

  factory MatchEvent.fromJson(Map<String, Object?> json) =>
      _$MatchEventFromJson(json);
}
