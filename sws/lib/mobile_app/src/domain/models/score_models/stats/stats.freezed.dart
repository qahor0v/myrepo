// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Stats _$StatsFromJson(Map<String, dynamic> json) {
  return _Stats.fromJson(json);
}

/// @nodoc
mixin _$Stats {
  String get type => throw _privateConstructorUsedError;
  String get home => throw _privateConstructorUsedError;
  String get away => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatsCopyWith<Stats> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsCopyWith<$Res> {
  factory $StatsCopyWith(Stats value, $Res Function(Stats) then) =
      _$StatsCopyWithImpl<$Res, Stats>;
  @useResult
  $Res call({String type, String home, String away});
}

/// @nodoc
class _$StatsCopyWithImpl<$Res, $Val extends Stats>
    implements $StatsCopyWith<$Res> {
  _$StatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? home = null,
    Object? away = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      home: null == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as String,
      away: null == away
          ? _value.away
          : away // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StatsCopyWith<$Res> implements $StatsCopyWith<$Res> {
  factory _$$_StatsCopyWith(_$_Stats value, $Res Function(_$_Stats) then) =
      __$$_StatsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String home, String away});
}

/// @nodoc
class __$$_StatsCopyWithImpl<$Res> extends _$StatsCopyWithImpl<$Res, _$_Stats>
    implements _$$_StatsCopyWith<$Res> {
  __$$_StatsCopyWithImpl(_$_Stats _value, $Res Function(_$_Stats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? home = null,
    Object? away = null,
  }) {
    return _then(_$_Stats(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      home: null == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as String,
      away: null == away
          ? _value.away
          : away // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Stats implements _Stats {
  const _$_Stats({required this.type, required this.home, required this.away});

  factory _$_Stats.fromJson(Map<String, dynamic> json) =>
      _$$_StatsFromJson(json);

  @override
  final String type;
  @override
  final String home;
  @override
  final String away;

  @override
  String toString() {
    return 'Stats(type: $type, home: $home, away: $away)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Stats &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.home, home) || other.home == home) &&
            (identical(other.away, away) || other.away == away));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, home, away);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatsCopyWith<_$_Stats> get copyWith =>
      __$$_StatsCopyWithImpl<_$_Stats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatsToJson(
      this,
    );
  }
}

abstract class _Stats implements Stats {
  const factory _Stats(
      {required final String type,
      required final String home,
      required final String away}) = _$_Stats;

  factory _Stats.fromJson(Map<String, dynamic> json) = _$_Stats.fromJson;

  @override
  String get type;
  @override
  String get home;
  @override
  String get away;
  @override
  @JsonKey(ignore: true)
  _$$_StatsCopyWith<_$_Stats> get copyWith =>
      throw _privateConstructorUsedError;
}
