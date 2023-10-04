import 'package:bloc/bloc.dart';
import 'package:crypto_app/domain/entities/price_entity.dart';
import 'package:crypto_app/domain/usecases/close_connection_usecase.dart';
import 'package:crypto_app/domain/usecases/get_price_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_event.dart';
part 'price_state.dart';
part 'price_bloc.freezed.dart';

class PriceBloc extends Bloc<PriceEvent, PriceState> {
  final GetPriceUseCase getPriceUseCase;
  final CloseConnectionUseCase closeConnectionUseCase;

  PriceBloc(
      {required this.getPriceUseCase, required this.closeConnectionUseCase})
      : super(
            PriceState(price: const Price(price: 0), status: Status.initial)) {
    on<GetPrice>(_onGetPrice);
    on<CloseConnection>(_onCloseConnection);
  }

  Future<void> _onGetPrice(GetPrice event, Emitter emit) async {
    emit(state.copyWith(status: Status.loading));

    try {
      await emit.forEach(getPriceUseCase.call(cryptoName: event.cryptoName),
          onData: (Price price) =>
              PriceState(status: Status.loaded, price: price));
    } catch (error) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  Future<void> _onCloseConnection(CloseConnection event, Emitter emit) async {
    try {
      await closeConnectionUseCase.call();

      emit(state.copyWith(status: Status.initial));
    } catch (error) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
