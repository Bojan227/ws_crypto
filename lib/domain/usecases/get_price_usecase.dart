import 'package:crypto_app/domain/entities/price_entity.dart';
import 'package:crypto_app/domain/repositories/crypto_repository.dart';

class GetPriceUseCase {
  final CryptoRepository cryptoRepository;

  GetPriceUseCase({required this.cryptoRepository});

  Stream<Price> call({required String cryptoName}) async* {
    yield* cryptoRepository.getPrice(cryptoName);
  }
}
