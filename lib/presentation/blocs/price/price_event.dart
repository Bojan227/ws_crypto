part of 'price_bloc.dart';

@freezed
class PriceEvent with _$PriceEvent {
  const factory PriceEvent.getPrice({required String cryptoName}) = GetPrice;
  const factory PriceEvent.closeConnection() = CloseConnection;
}
