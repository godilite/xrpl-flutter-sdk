import 'dart:io';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:xrpl_flutter_sdk/src/client/interfaces/xrp_args.dart';
import 'package:xrpl_flutter_sdk/src/client/interfaces/xrp_client.dart';
import 'package:xrpl_flutter_sdk/src/client/interfaces/xrp_response.dart';
import 'package:xrpl_flutter_sdk/src/client/mapper/xrp_response_mapper.dart';
import 'package:xrpl_flutter_sdk/src/utils/public_api_commands.dart';

class XrpWebSocketClient implements XrpClient {
  late final WebSocketChannel _channel;
  late PublicApiCommands _method;

  @override
  void connect(String url) {
    _channel = WebSocketChannel.connect(Uri.parse(url));
  }

  Future<void> sendMessage(XrpArgs args) async {
    final command = args.toWebSocketJson()['command'];
    _method = PublicApiCommands.fromString(command);

    if (!await _isConnected()) {
      throw const WebSocketException('WebSocket connection is not established.');
    }

    _channel.sink.add(args.toWebSocketJson());
  }

  @override
  Future<void> close() async {
    if (await _isConnected()) {
      _channel.sink.close();
    }
  }

  Stream<XrpResponse> get stream => _channel.stream.map((event) {
        return XrpResponseMapper.instance.fromJson(_method, event);
      });

  // Method to check if the WebSocket connection is established
  Future<bool> _isConnected() async {
    return await _channel.sink.done;
  }
}
