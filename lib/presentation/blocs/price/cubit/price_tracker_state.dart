// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'price_tracker_cubit.dart';

class PriceTrackerState {
  final bool hasDropped;
  final bool hasChanged;

  PriceTrackerState({required this.hasDropped, required this.hasChanged});

  PriceTrackerState copyWith({
    bool? hasDropped,
    bool? hasChanged,
  }) {
    return PriceTrackerState(
      hasDropped: hasDropped ?? this.hasDropped,
      hasChanged: hasChanged ?? this.hasChanged,
    );
  }
}
