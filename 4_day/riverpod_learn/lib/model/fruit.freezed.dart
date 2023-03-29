// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fruit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Fruit {
  String get name => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FruitCopyWith<Fruit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FruitCopyWith<$Res> {
  factory $FruitCopyWith(Fruit value, $Res Function(Fruit) then) =
      _$FruitCopyWithImpl<$Res, Fruit>;
  @useResult
  $Res call({String name, Color color});
}

/// @nodoc
class _$FruitCopyWithImpl<$Res, $Val extends Fruit>
    implements $FruitCopyWith<$Res> {
  _$FruitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FruitCopyWith<$Res> implements $FruitCopyWith<$Res> {
  factory _$$_FruitCopyWith(_$_Fruit value, $Res Function(_$_Fruit) then) =
      __$$_FruitCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, Color color});
}

/// @nodoc
class __$$_FruitCopyWithImpl<$Res> extends _$FruitCopyWithImpl<$Res, _$_Fruit>
    implements _$$_FruitCopyWith<$Res> {
  __$$_FruitCopyWithImpl(_$_Fruit _value, $Res Function(_$_Fruit) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? color = null,
  }) {
    return _then(_$_Fruit(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$_Fruit implements _Fruit {
  const _$_Fruit({required this.name, required this.color});

  @override
  final String name;
  @override
  final Color color;

  @override
  String toString() {
    return 'Fruit(name: $name, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fruit &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FruitCopyWith<_$_Fruit> get copyWith =>
      __$$_FruitCopyWithImpl<_$_Fruit>(this, _$identity);
}

abstract class _Fruit implements Fruit {
  const factory _Fruit(
      {required final String name, required final Color color}) = _$_Fruit;

  @override
  String get name;
  @override
  Color get color;
  @override
  @JsonKey(ignore: true)
  _$$_FruitCopyWith<_$_Fruit> get copyWith =>
      throw _privateConstructorUsedError;
}
