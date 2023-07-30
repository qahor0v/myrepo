// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Change _$ChangeFromJson(Map<String, dynamic> json) {
  return _Change.fromJson(json);
}

/// @nodoc
mixin _$Change {
  String get time => throw _privateConstructorUsedError;
  String get substitution => throw _privateConstructorUsedError;
  String get substitution_player_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangeCopyWith<Change> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangeCopyWith<$Res> {
  factory $ChangeCopyWith(Change value, $Res Function(Change) then) =
      _$ChangeCopyWithImpl<$Res, Change>;
  @useResult
  $Res call({String time, String substitution, String substitution_player_id});
}

/// @nodoc
class _$ChangeCopyWithImpl<$Res, $Val extends Change>
    implements $ChangeCopyWith<$Res> {
  _$ChangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? substitution = null,
    Object? substitution_player_id = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      substitution: null == substitution
          ? _value.substitution
          : substitution // ignore: cast_nullable_to_non_nullable
              as String,
      substitution_player_id: null == substitution_player_id
          ? _value.substitution_player_id
          : substitution_player_id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChangeCopyWith<$Res> implements $ChangeCopyWith<$Res> {
  factory _$$_ChangeCopyWith(_$_Change value, $Res Function(_$_Change) then) =
      __$$_ChangeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String time, String substitution, String substitution_player_id});
}

/// @nodoc
class __$$_ChangeCopyWithImpl<$Res>
    extends _$ChangeCopyWithImpl<$Res, _$_Change>
    implements _$$_ChangeCopyWith<$Res> {
  __$$_ChangeCopyWithImpl(_$_Change _value, $Res Function(_$_Change) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? substitution = null,
    Object? substitution_player_id = null,
  }) {
    return _then(_$_Change(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      substitution: null == substitution
          ? _value.substitution
          : substitution // ignore: cast_nullable_to_non_nullable
              as String,
      substitution_player_id: null == substitution_player_id
          ? _value.substitution_player_id
          : substitution_player_id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Change implements _Change {
  const _$_Change(
      {required this.time,
      required this.substitution,
      required this.substitution_player_id});

  factory _$_Change.fromJson(Map<String, dynamic> json) =>
      _$$_ChangeFromJson(json);

  @override
  final String time;
  @override
  final String substitution;
  @override
  final String substitution_player_id;

  @override
  String toString() {
    return 'Change(time: $time, substitution: $substitution, substitution_player_id: $substitution_player_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Change &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.substitution, substitution) ||
                other.substitution == substitution) &&
            (identical(other.substitution_player_id, substitution_player_id) ||
                other.substitution_player_id == substitution_player_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, time, substitution, substitution_player_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeCopyWith<_$_Change> get copyWith =>
      __$$_ChangeCopyWithImpl<_$_Change>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChangeToJson(
      this,
    );
  }
}

abstract class _Change implements Change {
  const factory _Change(
      {required final String time,
      required final String substitution,
      required final String substitution_player_id}) = _$_Change;

  factory _Change.fromJson(Map<String, dynamic> json) = _$_Change.fromJson;

  @override
  String get time;
  @override
  String get substitution;
  @override
  String get substitution_player_id;
  @override
  @JsonKey(ignore: true)
  _$$_ChangeCopyWith<_$_Change> get copyWith =>
      throw _privateConstructorUsedError;
}
