// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'standing.freezed.dart';

part 'standing.g.dart';

@freezed
class Standing with _$Standing {
  const factory Standing({
    required String country_name,
    required String league_id,
    required String league_name,
    required String team_id,
    required String team_name,
    required String overall_promotion,
    required String overall_league_position,
    required String overall_league_payed,
    required String overall_league_W,
    required String overall_league_D,
    required String overall_league_L,
    required String overall_league_GF,
    required String overall_league_GA,
    required String overall_league_PTS,
    required String home_league_position,
    required String team_badge,
  }) = _Standing;

  factory Standing.fromJson(Map<String, Object?> json) =>
      _$StandingFromJson(json);
}
