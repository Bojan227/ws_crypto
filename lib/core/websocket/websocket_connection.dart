import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketConnection {
  final String wsUrl;

  WebSocketConnection({required this.wsUrl});

  late WebSocketChannel? channel;

  WebSocketChannel? get currentChannel => channel;

  void createWSChannel(String query) {
    final baseUrl = Uri.parse("$wsUrl$query");
    channel = WebSocketChannel.connect(baseUrl);
  }

  Future<void> closeChannel() async {
    if (channel != null) {
      await channel?.sink.close();
    }
  }
}
