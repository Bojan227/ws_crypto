import 'dart:convert';

import 'package:crypto_app/core/websocket/websocket_connection.dart';
import 'package:crypto_app/data/models/asset_model.dart';
import 'package:crypto_app/data/models/price_model.dart';
import 'package:dio/dio.dart';

abstract class CryptoRemoteDataSource {
  Stream<PriceDto> getPrice({required String cryptoName});
  Future<void> closeConnection();
  Future<AssetDto> getAssets();
}

class CryptoRemoteDataSourceImpl implements CryptoRemoteDataSource {
  final WebSocketConnection webSocketConnection;
  final Dio dio;

  CryptoRemoteDataSourceImpl(
      {required this.webSocketConnection, required this.dio});

  @override
  Stream<PriceDto> getPrice({required String cryptoName}) async* {
    try {
      webSocketConnection.createWSChannel("/prices?assets=$cryptoName");
      final channel = webSocketConnection.currentChannel;

      if (channel != null) {
        await for (var event in channel.stream) {
          yield PriceDto(jsonDecode(event));
        }
      }
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> closeConnection() async {
    await webSocketConnection.closeChannel();
  }

  @override
  Future<AssetDto> getAssets() async {
    final response = await dio.get<Map<String, dynamic>>('/assets');

    return AssetDto.fromJson(response.data!);
  }
}
