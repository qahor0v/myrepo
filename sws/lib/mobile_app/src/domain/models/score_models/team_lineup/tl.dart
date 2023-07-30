// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/lineup_player/lp.dart';

part 'tl.freezed.dart';

part 'tl.g.dart';

@freezed
class TeamLineup with _$TeamLineup {
  const factory TeamLineup({
    required List<LineupPlayer> starting_lineups,
    required List<LineupPlayer> substitutes,
    required List<LineupPlayer> coach,
    required List<LineupPlayer> missing_players,
  }) = _TeamLineup;

  factory TeamLineup.fromJson(Map<String, Object?> json) =>
      _$TeamLineupFromJson(json);
}
