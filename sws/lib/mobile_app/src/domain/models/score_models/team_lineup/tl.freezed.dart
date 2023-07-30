// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TeamLineup _$TeamLineupFromJson(Map<String, dynamic> json) {
  return _TeamLineup.fromJson(json);
}

/// @nodoc
mixin _$TeamLineup {
  List<LineupPlayer> get starting_lineups => throw _privateConstructorUsedError;
  List<LineupPlayer> get substitutes => throw _privateConstructorUsedError;
  List<LineupPlayer> get coach => throw _privateConstructorUsedError;
  List<LineupPlayer> get missing_players => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamLineupCopyWith<TeamLineup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamLineupCopyWith<$Res> {
  factory $TeamLineupCopyWith(
          TeamLineup value, $Res Function(TeamLineup) then) =
      _$TeamLineupCopyWithImpl<$Res, TeamLineup>;
  @useResult
  $Res call(
      {List<LineupPlayer> starting_lineups,
      List<LineupPlayer> substitutes,
      List<LineupPlayer> coach,
      List<LineupPlayer> missing_players});
}

/// @nodoc
class _$TeamLineupCopyWithImpl<$Res, $Val extends TeamLineup>
    implements $TeamLineupCopyWith<$Res> {
  _$TeamLineupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? starting_lineups = null,
    Object? substitutes = null,
    Object? coach = null,
    Object? missing_players = null,
  }) {
    return _then(_value.copyWith(
      starting_lineups: null == starting_lineups
          ? _value.starting_lineups
          : starting_lineups // ignore: cast_nullable_to_non_nullable
              as List<LineupPlayer>,
      substitutes: null == substitutes
          ? _value.substitutes
          : substitutes // ignore: cast_nullable_to_non_nullable
              as List<LineupPlayer>,
      coach: null == coach
          ? _value.coach
          : coach // ignore: cast_nullable_to_non_nullable
              as List<LineupPlayer>,
      missing_players: null == missing_players
          ? _value.missing_players
          : missing_players // ignore: cast_nullable_to_non_nullable
              as List<LineupPlayer>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TeamLineupCopyWith<$Res>
    implements $TeamLineupCopyWith<$Res> {
  factory _$$_TeamLineupCopyWith(
          _$_TeamLineup value, $Res Function(_$_TeamLineup) then) =
      __$$_TeamLineupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<LineupPlayer> starting_lineups,
      List<LineupPlayer> substitutes,
      List<LineupPlayer> coach,
      List<LineupPlayer> missing_players});
}

/// @nodoc
class __$$_TeamLineupCopyWithImpl<$Res>
    extends _$TeamLineupCopyWithImpl<$Res, _$_TeamLineup>
    implements _$$_TeamLineupCopyWith<$Res> {
  __$$_TeamLineupCopyWithImpl(
      _$_TeamLineup _value, $Res Function(_$_TeamLineup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? starting_lineups = null,
    Object? substitutes = null,
    Object? coach = null,
    Object? missing_players = null,
  }) {
    return _then(_$_TeamLineup(
      starting_lineups: null == starting_lineups
          ? _value._starting_lineups
          : starting_lineups // ignore: cast_nullable_to_non_nullable
              as List<LineupPlayer>,
      substitutes: null == substitutes
          ? _value._substitutes
          : substitutes // ignore: cast_nullable_to_non_nullable
              as List<LineupPlayer>,
      coach: null == coach
          ? _value._coach
          : coach // ignore: cast_nullable_to_non_nullable
              as List<LineupPlayer>,
      missing_players: null == missing_players
          ? _value._missing_players
          : missing_players // ignore: cast_nullable_to_non_nullable
              as List<LineupPlayer>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TeamLineup implements _TeamLineup {
  const _$_TeamLineup(
      {required final List<LineupPlayer> starting_lineups,
      required final List<LineupPlayer> substitutes,
      required final List<LineupPlayer> coach,
      required final List<LineupPlayer> missing_players})
      : _starting_lineups = starting_lineups,
        _substitutes = substitutes,
        _coach = coach,
        _missing_players = missing_players;

  factory _$_TeamLineup.fromJson(Map<String, dynamic> json) =>
      _$$_TeamLineupFromJson(json);

  final List<LineupPlayer> _starting_lineups;
  @override
  List<LineupPlayer> get starting_lineups {
    if (_starting_lineups is EqualUnmodifiableListView)
      return _starting_lineups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_starting_lineups);
  }

  final List<LineupPlayer> _substitutes;
  @override
  List<LineupPlayer> get substitutes {
    if (_substitutes is EqualUnmodifiableListView) return _substitutes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_substitutes);
  }

  final List<LineupPlayer> _coach;
  @override
  List<LineupPlayer> get coach {
    if (_coach is EqualUnmodifiableListView) return _coach;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coach);
  }

  final List<LineupPlayer> _missing_players;
  @override
  List<LineupPlayer> get missing_players {
    if (_missing_players is EqualUnmodifiableListView) return _missing_players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_missing_players);
  }

  @override
  String toString() {
    return 'TeamLineup(starting_lineups: $starting_lineups, substitutes: $substitutes, coach: $coach, missing_players: $missing_players)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TeamLineup &&
            const DeepCollectionEquality()
                .equals(other._starting_lineups, _starting_lineups) &&
            const DeepCollectionEquality()
                .equals(other._substitutes, _substitutes) &&
            const DeepCollectionEquality().equals(other._coach, _coach) &&
            const DeepCollectionEquality()
                .equals(other._missing_players, _missing_players));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_starting_lineups),
      const DeepCollectionEquality().hash(_substitutes),
      const DeepCollectionEquality().hash(_coach),
      const DeepCollectionEquality().hash(_missing_players));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TeamLineupCopyWith<_$_TeamLineup> get copyWith =>
      __$$_TeamLineupCopyWithImpl<_$_TeamLineup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeamLineupToJson(
      this,
    );
  }
}

abstract class _TeamLineup implements TeamLineup {
  const factory _TeamLineup(
      {required final List<LineupPlayer> starting_lineups,
      required final List<LineupPlayer> substitutes,
      required final List<LineupPlayer> coach,
      required final List<LineupPlayer> missing_players}) = _$_TeamLineup;

  factory _TeamLineup.fromJson(Map<String, dynamic> json) =
      _$_TeamLineup.fromJson;

  @override
  List<LineupPlayer> get starting_lineups;
  @override
  List<LineupPlayer> get substitutes;
  @override
  List<LineupPlayer> get coach;
  @override
  List<LineupPlayer> get missing_players;
  @override
  @JsonKey(ignore: true)
  _$$_TeamLineupCopyWith<_$_TeamLineup> get copyWith =>
      throw _privateConstructorUsedError;
}
