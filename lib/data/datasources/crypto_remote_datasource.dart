import 'dart:convert';

import 'package:crypto_app/core/websocket/websocket_connection.dart';
import 'package:crypto_app/data/models/price_model.dart';

abstract class CryptoRemoteDataSource {
  Stream<PriceDto> getPrice({required String cryptoName});
  Future<void> closeConnection();
}

class CryptoRemoteDataSourceImpl implements CryptoRemoteDataSource {
  final WebSocketConnection webSocketConnection;

  CryptoRemoteDataSourceImpl({required this.webSocketConnection});

  @override
  Stream<PriceDto> getPrice({required String cryptoName}) async* {
    try {
      webSocketConnection.createWSChannel("/prices?assets=$cryptoName");
      final channel = webSocketConnection.currentChannel;
      await for (var event in channel.stream) {
        print(event);
        yield PriceDto(jsonDecode(event));
      }
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> closeConnection() async {
    await webSocketConnection.closeChannel();
  }
}
