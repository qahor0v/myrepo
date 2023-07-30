// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'c.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Card _$CardFromJson(Map<String, dynamic> json) {
  return _Card.fromJson(json);
}

/// @nodoc
mixin _$Card {
  String get time => throw _privateConstructorUsedError;
  String get home_fault => throw _privateConstructorUsedError;
  String get card => throw _privateConstructorUsedError;
  String get away_fault => throw _privateConstructorUsedError;
  String get info => throw _privateConstructorUsedError;
  String get home_player_id => throw _privateConstructorUsedError;
  String get away_player_id => throw _privateConstructorUsedError;
  String get score_info_time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardCopyWith<Card> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardCopyWith<$Res> {
  factory $CardCopyWith(Card value, $Res Function(Card) then) =
      _$CardCopyWithImpl<$Res, Card>;
  @useResult
  $Res call(
      {String time,
      String home_fault,
      String card,
      String away_fault,
      String info,
      String home_player_id,
      String away_player_id,
      String score_info_time});
}

/// @nodoc
class _$CardCopyWithImpl<$Res, $Val extends Card>
    implements $CardCopyWith<$Res> {
  _$CardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? home_fault = null,
    Object? card = null,
    Object? away_fault = null,
    Object? info = null,
    Object? home_player_id = null,
    Object? away_player_id = null,
    Object? score_info_time = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      home_fault: null == home_fault
          ? _value.home_fault
          : home_fault // ignore: cast_nullable_to_non_nullable
              as String,
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as String,
      away_fault: null == away_fault
          ? _value.away_fault
          : away_fault // ignore: cast_nullable_to_non_nullable
              as String,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
      home_player_id: null == home_player_id
          ? _value.home_player_id
          : home_player_id // ignore: cast_nullable_to_non_nullable
              as String,
      away_player_id: null == away_player_id
          ? _value.away_player_id
          : away_player_id // ignore: cast_nullable_to_non_nullable
              as String,
      score_info_time: null == score_info_time
          ? _value.score_info_time
          : score_info_time // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CardCopyWith<$Res> implements $CardCopyWith<$Res> {
  factory _$$_CardCopyWith(_$_Card value, $Res Function(_$_Card) then) =
      __$$_CardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String time,
      String home_fault,
      String card,
      String away_fault,
      String info,
      String home_player_id,
      String away_player_id,
      String score_info_time});
}

/// @nodoc
class __$$_CardCopyWithImpl<$Res> extends _$CardCopyWithImpl<$Res, _$_Card>
    implements _$$_CardCopyWith<$Res> {
  __$$_CardCopyWithImpl(_$_Card _value, $Res Function(_$_Card) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? home_fault = null,
    Object? card = null,
    Object? away_fault = null,
    Object? info = null,
    Object? home_player_id = null,
    Object? away_player_id = null,
    Object? score_info_time = null,
  }) {
    return _then(_$_Card(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      home_fault: null == home_fault
          ? _value.home_fault
          : home_fault // ignore: cast_nullable_to_non_nullable
              as String,
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as String,
      away_fault: null == away_fault
          ? _value.away_fault
          : away_fault // ignore: cast_nullable_to_non_nullable
              as String,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
      home_player_id: null == home_player_id
          ? _value.home_player_id
          : home_player_id // ignore: cast_nullable_to_non_nullable
              as String,
      away_player_id: null == away_player_id
          ? _value.away_player_id
          : away_player_id // ignore: cast_nullable_to_non_nullable
              as String,
      score_info_time: null == score_info_time
          ? _value.score_info_time
          : score_info_time // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Card implements _Card {
  const _$_Card(
      {required this.time,
      required this.home_fault,
      required this.card,
      required this.away_fault,
      required this.info,
      required this.home_player_id,
      required this.away_player_id,
      required this.score_info_time});

  factory _$_Card.fromJson(Map<String, dynamic> json) => _$$_CardFromJson(json);

  @override
  final String time;
  @override
  final String home_fault;
  @override
  final String card;
  @override
  final String away_fault;
  @override
  final String info;
  @override
  final String home_player_id;
  @override
  final String away_player_id;
  @override
  final String score_info_time;

  @override
  String toString() {
    return 'Card(time: $time, home_fault: $home_fault, card: $card, away_fault: $away_fault, info: $info, home_player_id: $home_player_id, away_player_id: $away_player_id, score_info_time: $score_info_time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Card &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.home_fault, home_fault) ||
                other.home_fault == home_fault) &&
            (identical(other.card, card) || other.card == card) &&
            (identical(other.away_fault, away_fault) ||
                other.away_fault == away_fault) &&
            (identical(other.info, info) || other.info == info) &&
            (identical(other.home_player_id, home_player_id) ||
                other.home_player_id == home_player_id) &&
            (identical(other.away_player_id, away_player_id) ||
                other.away_player_id == away_player_id) &&
            (identical(other.score_info_time, score_info_time) ||
                other.score_info_time == score_info_time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, time, home_fault, card,
      away_fault, info, home_player_id, away_player_id, score_info_time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardCopyWith<_$_Card> get copyWith =>
      __$$_CardCopyWithImpl<_$_Card>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardToJson(
      this,
    );
  }
}

abstract class _Card implements Card {
  const factory _Card(
      {required final String time,
      required final String home_fault,
      required final String card,
      required final String away_fault,
      required final String info,
      required final String home_player_id,
      required final String away_player_id,
      required final String score_info_time}) = _$_Card;

  factory _Card.fromJson(Map<String, dynamic> json) = _$_Card.fromJson;

  @override
  String get time;
  @override
  String get home_fault;
  @override
  String get card;
  @override
  String get away_fault;
  @override
  String get info;
  @override
  String get home_player_id;
  @override
  String get away_player_id;
  @override
  String get score_info_time;
  @override
  @JsonKey(ignore: true)
  _$$_CardCopyWith<_$_Card> get copyWith => throw _privateConstructorUsedError;
}
