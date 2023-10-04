import 'package:bloc/bloc.dart';
import 'package:crypto_app/domain/entities/asset_entity.dart';
import 'package:crypto_app/domain/usecases/get_assets_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'assets_event.dart';
part 'assets_state.dart';
part 'assets_bloc.freezed.dart';

class AssetsBloc extends Bloc<AssetsEvent, AssetsState> {
  final GetAssetsUseCase getAssetsUseCase;

  AssetsBloc({required this.getAssetsUseCase})
      : super(const AssetsState.initial()) {
    on<GetAssets>(_onGetAssets);
  }

  Future<void> _onGetAssets(GetAssets event, Emitter emit) async {
    emit(const AssetsState.loading());

    try {
      final List<Asset> assets = await getAssetsUseCase.call();

      emit(AssetsState.loaded(assets: assets));
    } catch (error) {
      emit(const AssetsState.failed());
    }
  }
}
