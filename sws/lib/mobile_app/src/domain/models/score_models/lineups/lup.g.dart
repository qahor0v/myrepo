// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Lineups _$$_LineupsFromJson(Map<String, dynamic> json) => _$_Lineups(
      home: TeamLineup.fromJson(json['home'] as Map<String, dynamic>),
      away: TeamLineup.fromJson(json['away'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LineupsToJson(_$_Lineups instance) =>
    <String, dynamic>{
      'home': instance.home,
      'away': instance.away,
    };
