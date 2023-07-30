///
//"lineup_player": "Lukasz Fabianski",
//             "lineup_number": "1",
//             "lineup_position": "1",
//             "player_key": "1705425493"

// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lp.freezed.dart';

part 'lp.g.dart';

@freezed
class LineupPlayer with _$LineupPlayer {
  const factory LineupPlayer({
    required String lineup_player,
    required String lineup_number,
    required String lineup_position,
    required String player_key,
  }) = _LineupPlayer;

  factory LineupPlayer.fromJson(Map<String, Object?> json) =>
      _$LineupPlayerFromJson(json);
}
