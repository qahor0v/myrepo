// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sws/mobile_app/src/domain/models/score_models/changes/ch.dart';

part 'stt.freezed.dart';

part 'stt.g.dart';

@freezed
class SubsTT with _$SubsTT {
  const factory SubsTT({
    required List<Change> home,
    required List<Change> away,
  }) = _SubsTT;

  factory SubsTT.fromJson(Map<String, Object?> json) => _$SubsTTFromJson(json);
}
