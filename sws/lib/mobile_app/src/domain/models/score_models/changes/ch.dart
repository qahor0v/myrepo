///time: 22,
// substitution: J. Kholturaev | A. Qayumov,
// substitution_player_id: 1570702311 | 0,

// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'ch.freezed.dart';

part 'ch.g.dart';

@freezed
class Change with _$Change {
  const factory Change({
    required String time,
    required String substitution,
    required String substitution_player_id,
  }) = _Change;

  factory Change.fromJson(Map<String, Object?> json) => _$ChangeFromJson(json);
}
