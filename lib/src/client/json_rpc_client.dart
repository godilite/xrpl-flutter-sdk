import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xrpl_flutter_sdk/src/client/mapper/xrp_response_mapper.dart';
import 'package:xrpl_flutter_sdk/src/utils/error_handling.dart';

import 'package:xrpl_flutter_sdk/xrpl_flutter_sdk.dart';

class XrpJsonRpcClient implements XrpClient {
  late http.Client _client;
  late NETWORK network;

  @override
  XrpJsonRpcClient connect(NETWORK network) {
    _client = http.Client();
    this.network = network;
    return this;
  }

  Future<XrpResponse> sendRequest(XrpArgs args) async {
    final jsonArgs = args.toRpcJson();
    final method = PublicApiCommands.fromString(jsonArgs['method'] as String);
    final response = await _sendRequest(method.value, jsonArgs);
    if (response.containsKey('error')) {
      handleUniversalError(response['error']);
    }

    final xprData = XrpResponseMapper.instance.fromJson(method, response);

    return xprData;
  }

  @override
  void close() {
    _client.close();
  }

  Future<Map<String, dynamic>> _sendRequest(String method, Map<String, dynamic> params) async {
    final response = await _client
        .post(Uri.parse(network.rpcUrl),
            headers: {
              'Content-Type': 'application/json',
            },
            body: json.encode(params))
        .timeout(const Duration(seconds: 30));

    return json.decode(response.body) as Map<String, dynamic>;
  }
}
