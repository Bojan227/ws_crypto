import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketConnection {
  final String wsUrl;

  WebSocketConnection({required this.wsUrl});

  WebSocketChannel createWSChannel(String url) {
    final baseUrl = Uri.parse("$wsUrl$url");
    return WebSocketChannel.connect(baseUrl);
  }
}
