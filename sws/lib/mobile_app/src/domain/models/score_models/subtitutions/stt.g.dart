// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubsTT _$$_SubsTTFromJson(Map<String, dynamic> json) => _$_SubsTT(
      home: (json['home'] as List<dynamic>)
          .map((e) => Change.fromJson(e as Map<String, dynamic>))
          .toList(),
      away: (json['away'] as List<dynamic>)
          .map((e) => Change.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SubsTTToJson(_$_SubsTT instance) => <String, dynamic>{
      'home': instance.home,
      'away': instance.away,
    };
