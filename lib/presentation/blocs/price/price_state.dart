part of 'price_bloc.dart';

@freezed
class PriceState with _$PriceState {
  const factory PriceState.initial() = _Initial;
  const factory PriceState.loading() = _Loading;
  const factory PriceState.loaded({required Price price}) = _PriceLoaded;
  const factory PriceState.error() = _Error;
}
