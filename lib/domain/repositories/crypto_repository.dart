import 'package:crypto_app/domain/entities/asset_entity.dart';
import 'package:crypto_app/domain/entities/price_entity.dart';

abstract class CryptoRepository {
  Stream<Price> getPrice(String cryptoName);
  Future<void> closeConnection();
  Future<List<Asset>> getAssets();
}
