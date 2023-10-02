import 'package:crypto_app/data/datasources/crypto_remote_datasource.dart';
import 'package:crypto_app/data/models/price_model.dart';
import 'package:crypto_app/domain/entities/price_entity.dart';
import 'package:crypto_app/domain/repositories/crypto_repository.dart';

class CryptoRepositoryImpl implements CryptoRepository {
  final CryptoRemoteDataSource cryptoRemoteDataSource;

  CryptoRepositoryImpl({required this.cryptoRemoteDataSource});

  @override
  Stream<Price> getPrice(String cryptoName) async* {
    final Stream<PriceDto> priceDto =
        cryptoRemoteDataSource.getPrice(cryptoName: cryptoName);

    await for (final dto in priceDto) {
      final price = dto.data[cryptoName]!;
      yield Price(price: price);
    }
  }

  @override
  Future<void> closeConnection() async {
    await cryptoRemoteDataSource.closeConnection();
  }
}
