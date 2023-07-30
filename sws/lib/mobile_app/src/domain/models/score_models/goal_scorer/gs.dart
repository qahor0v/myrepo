///time: 20,
// home_scorer: ,
// home_scorer_id: ,
// home_assist: ,
// home_assist_id: ,
// score: 0 - 1,
// away_scorer: F. Jumankuziev,
// away_scorer_id: ,
// away_assist: ,
// away_assist_id: ,
// info: ,
// score_info_time: 1st Half,

// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'gs.freezed.dart';

part 'gs.g.dart';

@freezed
class GoalScorer with _$GoalScorer {
  const factory GoalScorer({
    required String time,
    required String home_scorer,
    required String home_scorer_id,
    required String home_assist,
    required String home_assist_id,
    required String score,
    required String away_scorer,
    required String away_assist,
    required String away_scorer_id,
    required String away_assist_id,
    required String info,
    required String score_info_time,
  }) = _GoalScorer;

  factory GoalScorer.fromJson(Map<String, Object?> json) =>
      _$GoalScorerFromJson(json);
}
