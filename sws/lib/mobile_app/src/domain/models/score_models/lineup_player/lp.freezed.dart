// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LineupPlayer _$LineupPlayerFromJson(Map<String, dynamic> json) {
  return _LineupPlayer.fromJson(json);
}

/// @nodoc
mixin _$LineupPlayer {
  String get lineup_player => throw _privateConstructorUsedError;
  String get lineup_number => throw _privateConstructorUsedError;
  String get lineup_position => throw _privateConstructorUsedError;
  String get player_key => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LineupPlayerCopyWith<LineupPlayer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineupPlayerCopyWith<$Res> {
  factory $LineupPlayerCopyWith(
          LineupPlayer value, $Res Function(LineupPlayer) then) =
      _$LineupPlayerCopyWithImpl<$Res, LineupPlayer>;
  @useResult
  $Res call(
      {String lineup_player,
      String lineup_number,
      String lineup_position,
      String player_key});
}

/// @nodoc
class _$LineupPlayerCopyWithImpl<$Res, $Val extends LineupPlayer>
    implements $LineupPlayerCopyWith<$Res> {
  _$LineupPlayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lineup_player = null,
    Object? lineup_number = null,
    Object? lineup_position = null,
    Object? player_key = null,
  }) {
    return _then(_value.copyWith(
      lineup_player: null == lineup_player
          ? _value.lineup_player
          : lineup_player // ignore: cast_nullable_to_non_nullable
              as String,
      lineup_number: null == lineup_number
          ? _value.lineup_number
          : lineup_number // ignore: cast_nullable_to_non_nullable
              as String,
      lineup_position: null == lineup_position
          ? _value.lineup_position
          : lineup_position // ignore: cast_nullable_to_non_nullable
              as String,
      player_key: null == player_key
          ? _value.player_key
          : player_key // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LineupPlayerCopyWith<$Res>
    implements $LineupPlayerCopyWith<$Res> {
  factory _$$_LineupPlayerCopyWith(
          _$_LineupPlayer value, $Res Function(_$_LineupPlayer) then) =
      __$$_LineupPlayerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String lineup_player,
      String lineup_number,
      String lineup_position,
      String player_key});
}

/// @nodoc
class __$$_LineupPlayerCopyWithImpl<$Res>
    extends _$LineupPlayerCopyWithImpl<$Res, _$_LineupPlayer>
    implements _$$_LineupPlayerCopyWith<$Res> {
  __$$_LineupPlayerCopyWithImpl(
      _$_LineupPlayer _value, $Res Function(_$_LineupPlayer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lineup_player = null,
    Object? lineup_number = null,
    Object? lineup_position = null,
    Object? player_key = null,
  }) {
    return _then(_$_LineupPlayer(
      lineup_player: null == lineup_player
          ? _value.lineup_player
          : lineup_player // ignore: cast_nullable_to_non_nullable
              as String,
      lineup_number: null == lineup_number
          ? _value.lineup_number
          : lineup_number // ignore: cast_nullable_to_non_nullable
              as String,
      lineup_position: null == lineup_position
          ? _value.lineup_position
          : lineup_position // ignore: cast_nullable_to_non_nullable
              as String,
      player_key: null == player_key
          ? _value.player_key
          : player_key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LineupPlayer implements _LineupPlayer {
  const _$_LineupPlayer(
      {required this.lineup_player,
      required this.lineup_number,
      required this.lineup_position,
      required this.player_key});

  factory _$_LineupPlayer.fromJson(Map<String, dynamic> json) =>
      _$$_LineupPlayerFromJson(json);

  @override
  final String lineup_player;
  @override
  final String lineup_number;
  @override
  final String lineup_position;
  @override
  final String player_key;

  @override
  String toString() {
    return 'LineupPlayer(lineup_player: $lineup_player, lineup_number: $lineup_number, lineup_position: $lineup_position, player_key: $player_key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LineupPlayer &&
            (identical(other.lineup_player, lineup_player) ||
                other.lineup_player == lineup_player) &&
            (identical(other.lineup_number, lineup_number) ||
                other.lineup_number == lineup_number) &&
            (identical(other.lineup_position, lineup_position) ||
                other.lineup_position == lineup_position) &&
            (identical(other.player_key, player_key) ||
                other.player_key == player_key));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, lineup_player, lineup_number, lineup_position, player_key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LineupPlayerCopyWith<_$_LineupPlayer> get copyWith =>
      __$$_LineupPlayerCopyWithImpl<_$_LineupPlayer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LineupPlayerToJson(
      this,
    );
  }
}

abstract class _LineupPlayer implements LineupPlayer {
  const factory _LineupPlayer(
      {required final String lineup_player,
      required final String lineup_number,
      required final String lineup_position,
      required final String player_key}) = _$_LineupPlayer;

  factory _LineupPlayer.fromJson(Map<String, dynamic> json) =
      _$_LineupPlayer.fromJson;

  @override
  String get lineup_player;
  @override
  String get lineup_number;
  @override
  String get lineup_position;
  @override
  String get player_key;
  @override
  @JsonKey(ignore: true)
  _$$_LineupPlayerCopyWith<_$_LineupPlayer> get copyWith =>
      throw _privateConstructorUsedError;
}
