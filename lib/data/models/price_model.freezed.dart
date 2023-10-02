// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PriceDto _$PriceDtoFromJson(Map<String, dynamic> json) {
  return _PriceDto.fromJson(json);
}

/// @nodoc
mixin _$PriceDto {
  Map<String, dynamic> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceDtoCopyWith<PriceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceDtoCopyWith<$Res> {
  factory $PriceDtoCopyWith(PriceDto value, $Res Function(PriceDto) then) =
      _$PriceDtoCopyWithImpl<$Res, PriceDto>;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class _$PriceDtoCopyWithImpl<$Res, $Val extends PriceDto>
    implements $PriceDtoCopyWith<$Res> {
  _$PriceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceDtoImplCopyWith<$Res>
    implements $PriceDtoCopyWith<$Res> {
  factory _$$PriceDtoImplCopyWith(
          _$PriceDtoImpl value, $Res Function(_$PriceDtoImpl) then) =
      __$$PriceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$PriceDtoImplCopyWithImpl<$Res>
    extends _$PriceDtoCopyWithImpl<$Res, _$PriceDtoImpl>
    implements _$$PriceDtoImplCopyWith<$Res> {
  __$$PriceDtoImplCopyWithImpl(
      _$PriceDtoImpl _value, $Res Function(_$PriceDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$PriceDtoImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceDtoImpl with DiagnosticableTreeMixin implements _PriceDto {
  const _$PriceDtoImpl(final Map<String, dynamic> data) : _data = data;

  factory _$PriceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceDtoImplFromJson(json);

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PriceDto(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PriceDto'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceDtoImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceDtoImplCopyWith<_$PriceDtoImpl> get copyWith =>
      __$$PriceDtoImplCopyWithImpl<_$PriceDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceDtoImplToJson(
      this,
    );
  }
}

abstract class _PriceDto implements PriceDto {
  const factory _PriceDto(final Map<String, dynamic> data) = _$PriceDtoImpl;

  factory _PriceDto.fromJson(Map<String, dynamic> json) =
      _$PriceDtoImpl.fromJson;

  @override
  Map<String, dynamic> get data;
  @override
  @JsonKey(ignore: true)
  _$$PriceDtoImplCopyWith<_$PriceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
