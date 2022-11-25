// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'candlestick.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Candlestick {
  DateTime get time => throw _privateConstructorUsedError;
  num get open => throw _privateConstructorUsedError;
  num get high => throw _privateConstructorUsedError;
  num get low => throw _privateConstructorUsedError;
  num get close => throw _privateConstructorUsedError;
  num get volume => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CandlestickCopyWith<Candlestick> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandlestickCopyWith<$Res> {
  factory $CandlestickCopyWith(
          Candlestick value, $Res Function(Candlestick) then) =
      _$CandlestickCopyWithImpl<$Res, Candlestick>;
  @useResult
  $Res call(
      {DateTime time, num open, num high, num low, num close, num volume});
}

/// @nodoc
class _$CandlestickCopyWithImpl<$Res, $Val extends Candlestick>
    implements $CandlestickCopyWith<$Res> {
  _$CandlestickCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? open = null,
    Object? high = null,
    Object? low = null,
    Object? close = null,
    Object? volume = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as num,
      high: null == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as num,
      low: null == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as num,
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as num,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CandlestickCopyWith<$Res>
    implements $CandlestickCopyWith<$Res> {
  factory _$$_CandlestickCopyWith(
          _$_Candlestick value, $Res Function(_$_Candlestick) then) =
      __$$_CandlestickCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime time, num open, num high, num low, num close, num volume});
}

/// @nodoc
class __$$_CandlestickCopyWithImpl<$Res>
    extends _$CandlestickCopyWithImpl<$Res, _$_Candlestick>
    implements _$$_CandlestickCopyWith<$Res> {
  __$$_CandlestickCopyWithImpl(
      _$_Candlestick _value, $Res Function(_$_Candlestick) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? open = null,
    Object? high = null,
    Object? low = null,
    Object? close = null,
    Object? volume = null,
  }) {
    return _then(_$_Candlestick(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as num,
      high: null == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as num,
      low: null == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as num,
      close: null == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as num,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

class _$_Candlestick implements _Candlestick {
  const _$_Candlestick(
      {required this.time,
      required this.open,
      required this.high,
      required this.low,
      required this.close,
      required this.volume});

  @override
  final DateTime time;
  @override
  final num open;
  @override
  final num high;
  @override
  final num low;
  @override
  final num close;
  @override
  final num volume;

  @override
  String toString() {
    return 'Candlestick(time: $time, open: $open, high: $high, low: $low, close: $close, volume: $volume)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Candlestick &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.open, open) || other.open == open) &&
            (identical(other.high, high) || other.high == high) &&
            (identical(other.low, low) || other.low == low) &&
            (identical(other.close, close) || other.close == close) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, time, open, high, low, close, volume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CandlestickCopyWith<_$_Candlestick> get copyWith =>
      __$$_CandlestickCopyWithImpl<_$_Candlestick>(this, _$identity);
}

abstract class _Candlestick implements Candlestick {
  const factory _Candlestick(
      {required final DateTime time,
      required final num open,
      required final num high,
      required final num low,
      required final num close,
      required final num volume}) = _$_Candlestick;

  @override
  DateTime get time;
  @override
  num get open;
  @override
  num get high;
  @override
  num get low;
  @override
  num get close;
  @override
  num get volume;
  @override
  @JsonKey(ignore: true)
  _$$_CandlestickCopyWith<_$_Candlestick> get copyWith =>
      throw _privateConstructorUsedError;
}
