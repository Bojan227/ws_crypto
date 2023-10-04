import 'package:bloc/bloc.dart';

part 'price_tracker_state.dart';

class PriceTrackerCubit extends Cubit<PriceTrackerState> {
  PriceTrackerCubit()
      : super(PriceTrackerState(hasDropped: false, hasChanged: false));

  void updatePriceTracker(bool? dropped) {
    if (dropped != null) {
      emit(PriceTrackerState(hasDropped: dropped, hasChanged: true));
    }

    Future.delayed(
      const Duration(seconds: 1),
      () => resetChanged(),
    );
  }

  void resetChanged() {
    emit(state.copyWith(hasChanged: false));
  }
}
