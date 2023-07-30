// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/team_lineup/tl.dart';

part 'lup.freezed.dart';

part 'lup.g.dart';

@freezed
class Lineups with _$Lineups {
  const factory Lineups({
     required TeamLineup home,
    required TeamLineup away,
  }) = _Lineups;

  factory Lineups.fromJson(Map<String, Object?> json) => _$LineupsFromJson(json);
}
