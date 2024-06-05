import 'package:xrpl_flutter_sdk/src/client/interfaces/xrp_response.dart';

class LedgerCurrentResponse implements XrpResponse {
  /// id of the request that prompted this response (only for websocket requests)
  dynamic id;

  LedgerCurrentResultResponse result;

  LedgerCurrentResponse({
    required this.result,
    this.id,
  });

  @override
  factory LedgerCurrentResponse.fromRpcJson(Map<String, dynamic> json) {
    return LedgerCurrentResponse(
      result: LedgerCurrentResultResponse.fromJson(json),
    );
  }

  @override
  factory LedgerCurrentResponse.fromWebSocketJson(Map<String, dynamic> json) {
    return LedgerCurrentResponse(
      result: LedgerCurrentResultResponse.fromJson(json),
      id: json['id'],
    );
  }
}

class LedgerCurrentResultResponse {
  /// The Ledger Index of this ledger.
  int ledgerIndex;

  LedgerCurrentResultResponse({
    required this.ledgerIndex,
  });

  factory LedgerCurrentResultResponse.fromJson(Map<String, dynamic> json) {
    return LedgerCurrentResultResponse(
      ledgerIndex: json['ledger_current_index'],
    );
  }
}
