// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MatchEvent _$$_MatchEventFromJson(Map<String, dynamic> json) =>
    _$_MatchEvent(
      match_id: json['match_id'] as String,
      country_id: json['country_id'] as String,
      country_name: json['country_name'] as String,
      league_id: json['league_id'] as String,
      league_name: json['league_name'] as String,
      match_date: json['match_date'] as String,
      match_status: json['match_status'] as String,
      match_time: json['match_time'] as String,
      match_hometeam_id: json['match_hometeam_id'] as String,
      match_hometeam_name: json['match_hometeam_name'] as String,
      match_hometeam_score: json['match_hometeam_score'] as String,
      match_awayteam_name: json['match_awayteam_name'] as String,
      match_awayteam_id: json['match_awayteam_id'] as String,
      match_awayteam_score: json['match_awayteam_score'] as String,
      match_hometeam_halftime_score:
          json['match_hometeam_halftime_score'] as String,
      match_awayteam_halftime_score:
          json['match_awayteam_halftime_score'] as String,
      match_hometeam_extra_score: json['match_hometeam_extra_score'] as String,
      match_awayteam_extra_score: json['match_awayteam_extra_score'] as String,
      match_hometeam_penalty_score:
          json['match_hometeam_penalty_score'] as String,
      match_awayteam_penalty_score:
          json['match_awayteam_penalty_score'] as String,
      match_hometeam_ft_score: json['match_hometeam_ft_score'] as String,
      match_awayteam_ft_score: json['match_awayteam_ft_score'] as String,
      match_hometeam_system: json['match_hometeam_system'] as String,
      match_awayteam_system: json['match_awayteam_system'] as String,
      match_live: json['match_live'] as String,
      match_round: json['match_round'] as String,
      match_stadium: json['match_stadium'] as String,
      match_referee: json['match_referee'] as String,
      team_home_badge: json['team_home_badge'] as String,
      team_away_badge: json['team_away_badge'] as String,
      league_logo: json['league_logo'] as String,
      country_logo: json['country_logo'] as String,
      league_year: json['league_year'] as String,
      fk_stage_key: json['fk_stage_key'] as String,
      stage_name: json['stage_name'] as String,
      goalscorer: (json['goalscorer'] as List<dynamic>)
          .map((e) => GoalScorer.fromJson(e as Map<String, dynamic>))
          .toList(),
      cards: (json['cards'] as List<dynamic>)
          .map((e) => Card.fromJson(e as Map<String, dynamic>))
          .toList(),
      substitutions:
          SubsTT.fromJson(json['substitutions'] as Map<String, dynamic>),
      lineup: Lineups.fromJson(json['lineup'] as Map<String, dynamic>),
      statistics: (json['statistics'] as List<dynamic>)
          .map((e) => Stats.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MatchEventToJson(_$_MatchEvent instance) =>
    <String, dynamic>{
      'match_id': instance.match_id,
      'country_id': instance.country_id,
      'country_name': instance.country_name,
      'league_id': instance.league_id,
      'league_name': instance.league_name,
      'match_date': instance.match_date,
      'match_status': instance.match_status,
      'match_time': instance.match_time,
      'match_hometeam_id': instance.match_hometeam_id,
      'match_hometeam_name': instance.match_hometeam_name,
      'match_hometeam_score': instance.match_hometeam_score,
      'match_awayteam_name': instance.match_awayteam_name,
      'match_awayteam_id': instance.match_awayteam_id,
      'match_awayteam_score': instance.match_awayteam_score,
      'match_hometeam_halftime_score': instance.match_hometeam_halftime_score,
      'match_awayteam_halftime_score': instance.match_awayteam_halftime_score,
      'match_hometeam_extra_score': instance.match_hometeam_extra_score,
      'match_awayteam_extra_score': instance.match_awayteam_extra_score,
      'match_hometeam_penalty_score': instance.match_hometeam_penalty_score,
      'match_awayteam_penalty_score': instance.match_awayteam_penalty_score,
      'match_hometeam_ft_score': instance.match_hometeam_ft_score,
      'match_awayteam_ft_score': instance.match_awayteam_ft_score,
      'match_hometeam_system': instance.match_hometeam_system,
      'match_awayteam_system': instance.match_awayteam_system,
      'match_live': instance.match_live,
      'match_round': instance.match_round,
      'match_stadium': instance.match_stadium,
      'match_referee': instance.match_referee,
      'team_home_badge': instance.team_home_badge,
      'team_away_badge': instance.team_away_badge,
      'league_logo': instance.league_logo,
      'country_logo': instance.country_logo,
      'league_year': instance.league_year,
      'fk_stage_key': instance.fk_stage_key,
      'stage_name': instance.stage_name,
      'goalscorer': instance.goalscorer,
      'cards': instance.cards,
      'substitutions': instance.substitutions,
      'lineup': instance.lineup,
      'statistics': instance.statistics,
    };
