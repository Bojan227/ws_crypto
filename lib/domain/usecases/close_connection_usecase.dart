import 'package:crypto_app/domain/repositories/crypto_repository.dart';

class CloseConnectionUseCase {
  final CryptoRepository cryptoRepository;

  CloseConnectionUseCase({required this.cryptoRepository});

  Future<void> call() async {
    await cryptoRepository.closeConnection();
  }
}
