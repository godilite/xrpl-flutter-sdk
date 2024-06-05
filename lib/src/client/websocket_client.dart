import 'dart:convert';

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
  void connect(NETWORK network) {
    _channel = WebSocketChannel.connect(Uri.parse(network.websocketUrl));
  }

  Future<void> sendMessage(XrpArgs args) async {
    final jsonArgs = args.toWebSocketJson();
    final command = jsonArgs['command'];

    _method = PublicApiCommands.fromString(command);

    _channel.sink.add(jsonEncode(jsonArgs));
  }

  @override
  Future<void> close() async {
    if (await _isConnected() == true) {
      _channel.sink.close();
    }
  }

  void onMessage(Function(XrpResponse) callback) {
    _channel.stream.listen((message) {
      final response = XrpResponseMapper.instance.fromJson(_method, jsonDecode(message), isWebSocket: true);
      callback(response);
    });
  }

  // Method to check if the WebSocket connection is established
  Future<dynamic> _isConnected() async {
    return await _channel.sink.done;
  }
}
