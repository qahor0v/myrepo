// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GoalScorer _$$_GoalScorerFromJson(Map<String, dynamic> json) =>
    _$_GoalScorer(
      time: json['time'] as String,
      home_scorer: json['home_scorer'] as String,
      home_scorer_id: json['home_scorer_id'] as String,
      home_assist: json['home_assist'] as String,
      home_assist_id: json['home_assist_id'] as String,
      score: json['score'] as String,
      away_scorer: json['away_scorer'] as String,
      away_assist: json['away_assist'] as String,
      away_scorer_id: json['away_scorer_id'] as String,
      away_assist_id: json['away_assist_id'] as String,
      info: json['info'] as String,
      score_info_time: json['score_info_time'] as String,
    );

Map<String, dynamic> _$$_GoalScorerToJson(_$_GoalScorer instance) =>
    <String, dynamic>{
      'time': instance.time,
      'home_scorer': instance.home_scorer,
      'home_scorer_id': instance.home_scorer_id,
      'home_assist': instance.home_assist,
      'home_assist_id': instance.home_assist_id,
      'score': instance.score,
      'away_scorer': instance.away_scorer,
      'away_assist': instance.away_assist,
      'away_scorer_id': instance.away_scorer_id,
      'away_assist_id': instance.away_assist_id,
      'info': instance.info,
      'score_info_time': instance.score_info_time,
    };
