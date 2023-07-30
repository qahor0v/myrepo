///time: 15,
// home_fault: D. Juraev,
// card: yellow card,
// away_fault: ,
// info: ,
// home_player_id: ,
// away_player_id: ,
// score_info_time: 1st Half,

// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'c.freezed.dart';

part 'c.g.dart';

@freezed
class Card with _$Card {
  const factory Card({
    required String time,
    required String home_fault,
    required String card,
    required String away_fault,
    required String info,
    required String home_player_id,
    required String away_player_id,
    required String score_info_time,
  }) = _Card;

  factory Card.fromJson(Map<String, Object?> json) => _$CardFromJson(json);
}
