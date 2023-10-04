import 'package:crypto_app/domain/entities/asset_entity.dart';
import 'package:crypto_app/domain/repositories/crypto_repository.dart';

class GetAssetsUseCase {
  final CryptoRepository cryptoRepository;

  GetAssetsUseCase({required this.cryptoRepository});

  Future<List<Asset>> call() async {
    return await cryptoRepository.getAssets();
  }
}
