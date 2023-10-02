import 'dart:convert';

import 'package:crypto_app/core/websocket/websocket_connection.dart';
import 'package:crypto_app/data/models/price_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class CryptoRemoteDataSource {
  Stream<PriceDto> getPrice({required String cryptoName});
  Future<void> closeConnection();
}

class CryptoRemoteDataSourceImpl implements CryptoRemoteDataSource {
  final WebSocketConnection webSocketConnection;
  late WebSocketChannel channel;

  CryptoRemoteDataSourceImpl({required this.webSocketConnection});

  @override
  Stream<PriceDto> getPrice({required String cryptoName}) async* {
    try {
      channel =
          webSocketConnection.createWSChannel("/prices?assets=$cryptoName");

      await for (var event in channel.stream) {
        yield PriceDto(jsonDecode(event));
      }
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> closeConnection() async {
    await channel.sink.close();
  }
}
