// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubsTT _$SubsTTFromJson(Map<String, dynamic> json) {
  return _SubsTT.fromJson(json);
}

/// @nodoc
mixin _$SubsTT {
  List<Change> get home => throw _privateConstructorUsedError;
  List<Change> get away => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubsTTCopyWith<SubsTT> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubsTTCopyWith<$Res> {
  factory $SubsTTCopyWith(SubsTT value, $Res Function(SubsTT) then) =
      _$SubsTTCopyWithImpl<$Res, SubsTT>;
  @useResult
  $Res call({List<Change> home, List<Change> away});
}

/// @nodoc
class _$SubsTTCopyWithImpl<$Res, $Val extends SubsTT>
    implements $SubsTTCopyWith<$Res> {
  _$SubsTTCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? home = null,
    Object? away = null,
  }) {
    return _then(_value.copyWith(
      home: null == home
          ? _value.home
          : home // ignore: cast_nullable_to_non_nullable
              as List<Change>,
      away: null == away
          ? _value.away
          : away // ignore: cast_nullable_to_non_nullable
              as List<Change>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubsTTCopyWith<$Res> implements $SubsTTCopyWith<$Res> {
  factory _$$_SubsTTCopyWith(_$_SubsTT value, $Res Function(_$_SubsTT) then) =
      __$$_SubsTTCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Change> home, List<Change> away});
}

/// @nodoc
class __$$_SubsTTCopyWithImpl<$Res>
    extends _$SubsTTCopyWithImpl<$Res, _$_SubsTT>
    implements _$$_SubsTTCopyWith<$Res> {
  __$$_SubsTTCopyWithImpl(_$_SubsTT _value, $Res Function(_$_SubsTT) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? home = null,
    Object? away = null,
  }) {
    return _then(_$_SubsTT(
      home: null == home
          ? _value._home
          : home // ignore: cast_nullable_to_non_nullable
              as List<Change>,
      away: null == away
          ? _value._away
          : away // ignore: cast_nullable_to_non_nullable
              as List<Change>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubsTT implements _SubsTT {
  const _$_SubsTT(
      {required final List<Change> home, required final List<Change> away})
      : _home = home,
        _away = away;

  factory _$_SubsTT.fromJson(Map<String, dynamic> json) =>
      _$$_SubsTTFromJson(json);

  final List<Change> _home;
  @override
  List<Change> get home {
    if (_home is EqualUnmodifiableListView) return _home;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_home);
  }

  final List<Change> _away;
  @override
  List<Change> get away {
    if (_away is EqualUnmodifiableListView) return _away;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_away);
  }

  @override
  String toString() {
    return 'SubsTT(home: $home, away: $away)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubsTT &&
            const DeepCollectionEquality().equals(other._home, _home) &&
            const DeepCollectionEquality().equals(other._away, _away));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_home),
      const DeepCollectionEquality().hash(_away));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubsTTCopyWith<_$_SubsTT> get copyWith =>
      __$$_SubsTTCopyWithImpl<_$_SubsTT>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubsTTToJson(
      this,
    );
  }
}

abstract class _SubsTT implements SubsTT {
  const factory _SubsTT(
      {required final List<Change> home,
      required final List<Change> away}) = _$_SubsTT;

  factory _SubsTT.fromJson(Map<String, dynamic> json) = _$_SubsTT.fromJson;

  @override
  List<Change> get home;
  @override
  List<Change> get away;
  @override
  @JsonKey(ignore: true)
  _$$_SubsTTCopyWith<_$_SubsTT> get copyWith =>
      throw _privateConstructorUsedError;
}
