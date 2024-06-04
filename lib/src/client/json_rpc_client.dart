import 'dart:async';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:xrpl_flutter_sdk/src/client/interfaces/xrp_args.dart';
import 'package:xrpl_flutter_sdk/src/client/interfaces/xrp_response.dart';
import 'package:xrpl_flutter_sdk/src/client/mapper/xrp_response_mapper.dart';
import 'package:xrpl_flutter_sdk/src/utils/public_api_commands.dart';
import 'package:xrpl_flutter_sdk/xrpl_flutter_sdk.dart';
import 'package:json_rpc_2/json_rpc_2.dart';

class XrpJsonRpcClient implements XrpClient {
  late final WebSocketChannel _channel;
  late final Client _client;

  @override
  void connect(String url) {
    _channel = WebSocketChannel.connect(Uri.parse(url));
    _client = Client(_channel.cast<String>());
    unawaited(_client.listen());
  }

  Future<XrpResponse> sendRequest(XrpArgs args) async {
    final jsonArgs = args.toRpcJson();
    final params = jsonArgs['params'];
    final method = jsonArgs['method'] as PublicApiCommands;
    final response = await _client.sendRequest(method.value, params);
    final mapper = XrpResponseMapper.instance;

    return mapper.fromJson(method, response);
  }

  @override
  void close() {
    _client.close();
  }
}
