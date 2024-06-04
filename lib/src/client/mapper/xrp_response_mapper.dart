import 'package:xrpl_flutter_sdk/src/client/interfaces/xrp_response.dart';
import 'package:xrpl_flutter_sdk/src/ledger/models/response/ledger_closed_response.dart';
import 'package:xrpl_flutter_sdk/src/ledger/models/response/ledger_current_response.dart';
import 'package:xrpl_flutter_sdk/src/ledger/models/response/ledger_data_response.dart';
import 'package:xrpl_flutter_sdk/src/ledger/models/response/ledger_response.dart';
import 'package:xrpl_flutter_sdk/src/utils/public_api_commands.dart';

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
    }
  }
}
