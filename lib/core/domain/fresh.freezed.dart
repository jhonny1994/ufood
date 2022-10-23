// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fresh.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Fresh<T> {
  T get recipes => throw _privateConstructorUsedError;
  bool get isFresh => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FreshCopyWith<T, Fresh<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreshCopyWith<T, $Res> {
  factory $FreshCopyWith(Fresh<T> value, $Res Function(Fresh<T>) then) =
      _$FreshCopyWithImpl<T, $Res, Fresh<T>>;
  @useResult
  $Res call({T recipes, bool isFresh});
}

/// @nodoc
class _$FreshCopyWithImpl<T, $Res, $Val extends Fresh<T>>
    implements $FreshCopyWith<T, $Res> {
  _$FreshCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = null,
    Object? isFresh = null,
  }) {
    return _then(_value.copyWith(
      recipes: null == recipes
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as T,
      isFresh: null == isFresh
          ? _value.isFresh
          : isFresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FreshCopyWith<T, $Res> implements $FreshCopyWith<T, $Res> {
  factory _$$_FreshCopyWith(
          _$_Fresh<T> value, $Res Function(_$_Fresh<T>) then) =
      __$$_FreshCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T recipes, bool isFresh});
}

/// @nodoc
class __$$_FreshCopyWithImpl<T, $Res>
    extends _$FreshCopyWithImpl<T, $Res, _$_Fresh<T>>
    implements _$$_FreshCopyWith<T, $Res> {
  __$$_FreshCopyWithImpl(_$_Fresh<T> _value, $Res Function(_$_Fresh<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipes = null,
    Object? isFresh = null,
  }) {
    return _then(_$_Fresh<T>(
      recipes: null == recipes
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as T,
      isFresh: null == isFresh
          ? _value.isFresh
          : isFresh // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Fresh<T> extends _Fresh<T> {
  const _$_Fresh({required this.recipes, required this.isFresh}) : super._();

  @override
  final T recipes;
  @override
  final bool isFresh;

  @override
  String toString() {
    return 'Fresh<$T>(recipes: $recipes, isFresh: $isFresh)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fresh<T> &&
            const DeepCollectionEquality().equals(other.recipes, recipes) &&
            (identical(other.isFresh, isFresh) || other.isFresh == isFresh));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(recipes), isFresh);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FreshCopyWith<T, _$_Fresh<T>> get copyWith =>
      __$$_FreshCopyWithImpl<T, _$_Fresh<T>>(this, _$identity);
}

abstract class _Fresh<T> extends Fresh<T> {
  const factory _Fresh(
      {required final T recipes, required final bool isFresh}) = _$_Fresh<T>;
  const _Fresh._() : super._();

  @override
  T get recipes;
  @override
  bool get isFresh;
  @override
  @JsonKey(ignore: true)
  _$$_FreshCopyWith<T, _$_Fresh<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
