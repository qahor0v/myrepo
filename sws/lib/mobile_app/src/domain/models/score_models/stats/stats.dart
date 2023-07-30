// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats.freezed.dart';

part 'stats.g.dart';

@freezed
class Stats with _$Stats {
  const factory Stats({
    required String type,
    required String home,
    required String away,
  }) = _Stats;

  factory Stats.fromJson(Map<String, Object?> json) => _$StatsFromJson(json);
}
