import 'package:xrpl_flutter_sdk/xrpl_flutter_sdk.dart';

class XrpResponseMapper {
  XrpResponseMapper._();

  static final instance = XrpResponseMapper._();

  XrpResponse fromJson(PublicApiCommands method, Map<String, dynamic> json, {bool isWebSocket = false}) {
    return XrpResponseMapper._mapMethod(method, json, isWebSocket: isWebSocket);
  }

  static XrpResponse _mapMethod(PublicApiCommands method, Map<String, dynamic> json, {bool isWebSocket = false}) {
    switch (method) {
      case PublicApiCommands.ledger:
        return isWebSocket ? LedgerResponse.fromWebSocketJson(json) : LedgerResponse.fromRpcJson(json);
      case PublicApiCommands.ledgerClosed:
        return isWebSocket ? LedgerClosedResponse.fromWebSocketJson(json) : LedgerClosedResponse.fromRpcJson(json);
      case PublicApiCommands.ledgerCurrent:
        return isWebSocket ? LedgerCurrentResponse.fromWebSocketJson(json) : LedgerCurrentResponse.fromRpcJson(json);
      case PublicApiCommands.ledgerData:
        return isWebSocket ? LedgerDataResponse.fromWebSocketJson(json) : LedgerDataResponse.fromRpcJson(json);
      case PublicApiCommands.accountChannels:
        return isWebSocket ? AccountChannelResponse.fromWebSocketJson(json) : AccountChannelResponse.fromRpcJson(json);
      case PublicApiCommands.accountCurrencies:
        return isWebSocket
            ? AccountCurrenciesResponse.fromWebSocketJson(json)
            : AccountCurrenciesResponse.fromRpcJson(json);
      default:
        throw Exception('Unknown method: $method');
    }
  }
}
