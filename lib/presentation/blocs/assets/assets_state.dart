part of 'assets_bloc.dart';

@freezed
class AssetsState with _$AssetsState {
  const factory AssetsState.initial() = _Initial;
  const factory AssetsState.loading() = _Loading;
  const factory AssetsState.loaded({required List<Asset> assets}) = _Loaded;
  const factory AssetsState.failed() = _Failed;
}
