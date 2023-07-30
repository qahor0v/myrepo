// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'c.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Card _$$_CardFromJson(Map<String, dynamic> json) => _$_Card(
      time: json['time'] as String,
      home_fault: json['home_fault'] as String,
      card: json['card'] as String,
      away_fault: json['away_fault'] as String,
      info: json['info'] as String,
      home_player_id: json['home_player_id'] as String,
      away_player_id: json['away_player_id'] as String,
      score_info_time: json['score_info_time'] as String,
    );

Map<String, dynamic> _$$_CardToJson(_$_Card instance) => <String, dynamic>{
      'time': instance.time,
      'home_fault': instance.home_fault,
      'card': instance.card,
      'away_fault': instance.away_fault,
      'info': instance.info,
      'home_player_id': instance.home_player_id,
      'away_player_id': instance.away_player_id,
      'score_info_time': instance.score_info_time,
    };
