// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'price_bloc.dart';

enum Status { initial, loading, loaded, failure }

class PriceState {
  final Status status;
  final Price price;

  PriceState({required this.status, required this.price});

  PriceState copyWith({
    Status? status,
    Price? price,
  }) {
    return PriceState(
      status: status ?? this.status,
      price: price ?? this.price,
    );
  }
}
