import 'dart:convert';

import 'package:crypto_app/data/models/price_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class CryptoRemoteDataSource {
  Stream<PriceDto> getPrice({required String cryptoName});
  Future<void> closeConnection();
}

class CryptoRemoteDataSourceImpl implements CryptoRemoteDataSource {
  late WebSocketChannel webSocketChannel;
  final String wsUrl;

  CryptoRemoteDataSourceImpl({required this.wsUrl});
  @override
  Stream<PriceDto> getPrice({required String cryptoName}) async* {
    try {
      final baseUrl = Uri.parse("$wsUrl/prices?assets=$cryptoName");
      webSocketChannel = WebSocketChannel.connect(baseUrl);

      await for (var event in webSocketChannel.stream) {
        yield PriceDto(jsonDecode(event));
      }
    } catch (e) {
      print(e);
      throw Exception();
    }
  }

  @override
  Future<void> closeConnection() async {
    await webSocketChannel.sink.close();
  }
}
