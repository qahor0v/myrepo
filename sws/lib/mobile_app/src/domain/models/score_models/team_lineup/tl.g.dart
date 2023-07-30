// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TeamLineup _$$_TeamLineupFromJson(Map<String, dynamic> json) =>
    _$_TeamLineup(
      starting_lineups: (json['starting_lineups'] as List<dynamic>)
          .map((e) => LineupPlayer.fromJson(e as Map<String, dynamic>))
          .toList(),
      substitutes: (json['substitutes'] as List<dynamic>)
          .map((e) => LineupPlayer.fromJson(e as Map<String, dynamic>))
          .toList(),
      coach: (json['coach'] as List<dynamic>)
          .map((e) => LineupPlayer.fromJson(e as Map<String, dynamic>))
          .toList(),
      missing_players: (json['missing_players'] as List<dynamic>)
          .map((e) => LineupPlayer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TeamLineupToJson(_$_TeamLineup instance) =>
    <String, dynamic>{
      'starting_lineups': instance.starting_lineups,
      'substitutes': instance.substitutes,
      'coach': instance.coach,
      'missing_players': instance.missing_players,
    };
