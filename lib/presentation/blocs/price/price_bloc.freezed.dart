// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PriceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cryptoName) getPrice,
    required TResult Function() closeConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cryptoName)? getPrice,
    TResult? Function()? closeConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cryptoName)? getPrice,
    TResult Function()? closeConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPrice value) getPrice,
    required TResult Function(CloseConnection value) closeConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetPrice value)? getPrice,
    TResult? Function(CloseConnection value)? closeConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPrice value)? getPrice,
    TResult Function(CloseConnection value)? closeConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceEventCopyWith<$Res> {
  factory $PriceEventCopyWith(
          PriceEvent value, $Res Function(PriceEvent) then) =
      _$PriceEventCopyWithImpl<$Res, PriceEvent>;
}

/// @nodoc
class _$PriceEventCopyWithImpl<$Res, $Val extends PriceEvent>
    implements $PriceEventCopyWith<$Res> {
  _$PriceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetPriceImplCopyWith<$Res> {
  factory _$$GetPriceImplCopyWith(
          _$GetPriceImpl value, $Res Function(_$GetPriceImpl) then) =
      __$$GetPriceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cryptoName});
}

/// @nodoc
class __$$GetPriceImplCopyWithImpl<$Res>
    extends _$PriceEventCopyWithImpl<$Res, _$GetPriceImpl>
    implements _$$GetPriceImplCopyWith<$Res> {
  __$$GetPriceImplCopyWithImpl(
      _$GetPriceImpl _value, $Res Function(_$GetPriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cryptoName = null,
  }) {
    return _then(_$GetPriceImpl(
      cryptoName: null == cryptoName
          ? _value.cryptoName
          : cryptoName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetPriceImpl implements GetPrice {
  const _$GetPriceImpl({required this.cryptoName});

  @override
  final String cryptoName;

  @override
  String toString() {
    return 'PriceEvent.getPrice(cryptoName: $cryptoName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPriceImpl &&
            (identical(other.cryptoName, cryptoName) ||
                other.cryptoName == cryptoName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cryptoName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPriceImplCopyWith<_$GetPriceImpl> get copyWith =>
      __$$GetPriceImplCopyWithImpl<_$GetPriceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cryptoName) getPrice,
    required TResult Function() closeConnection,
  }) {
    return getPrice(cryptoName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cryptoName)? getPrice,
    TResult? Function()? closeConnection,
  }) {
    return getPrice?.call(cryptoName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cryptoName)? getPrice,
    TResult Function()? closeConnection,
    required TResult orElse(),
  }) {
    if (getPrice != null) {
      return getPrice(cryptoName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPrice value) getPrice,
    required TResult Function(CloseConnection value) closeConnection,
  }) {
    return getPrice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetPrice value)? getPrice,
    TResult? Function(CloseConnection value)? closeConnection,
  }) {
    return getPrice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPrice value)? getPrice,
    TResult Function(CloseConnection value)? closeConnection,
    required TResult orElse(),
  }) {
    if (getPrice != null) {
      return getPrice(this);
    }
    return orElse();
  }
}

abstract class GetPrice implements PriceEvent {
  const factory GetPrice({required final String cryptoName}) = _$GetPriceImpl;

  String get cryptoName;
  @JsonKey(ignore: true)
  _$$GetPriceImplCopyWith<_$GetPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CloseConnectionImplCopyWith<$Res> {
  factory _$$CloseConnectionImplCopyWith(_$CloseConnectionImpl value,
          $Res Function(_$CloseConnectionImpl) then) =
      __$$CloseConnectionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CloseConnectionImplCopyWithImpl<$Res>
    extends _$PriceEventCopyWithImpl<$Res, _$CloseConnectionImpl>
    implements _$$CloseConnectionImplCopyWith<$Res> {
  __$$CloseConnectionImplCopyWithImpl(
      _$CloseConnectionImpl _value, $Res Function(_$CloseConnectionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CloseConnectionImpl implements CloseConnection {
  const _$CloseConnectionImpl();

  @override
  String toString() {
    return 'PriceEvent.closeConnection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CloseConnectionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String cryptoName) getPrice,
    required TResult Function() closeConnection,
  }) {
    return closeConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String cryptoName)? getPrice,
    TResult? Function()? closeConnection,
  }) {
    return closeConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String cryptoName)? getPrice,
    TResult Function()? closeConnection,
    required TResult orElse(),
  }) {
    if (closeConnection != null) {
      return closeConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPrice value) getPrice,
    required TResult Function(CloseConnection value) closeConnection,
  }) {
    return closeConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetPrice value)? getPrice,
    TResult? Function(CloseConnection value)? closeConnection,
  }) {
    return closeConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPrice value)? getPrice,
    TResult Function(CloseConnection value)? closeConnection,
    required TResult orElse(),
  }) {
    if (closeConnection != null) {
      return closeConnection(this);
    }
    return orElse();
  }
}

abstract class CloseConnection implements PriceEvent {
  const factory CloseConnection() = _$CloseConnectionImpl;
}
