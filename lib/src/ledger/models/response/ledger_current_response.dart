import 'package:xrpl_flutter_sdk/src/client/interfaces/xrp_response.dart';

class LedgerCurrentResponse implements XrpResponse {
  /// id of the request that prompted this response (only for websocket requests)
  dynamic id;

  LedgerResultResponse result;

  LedgerCurrentResponse({
    required this.result,
    this.id,
  });

  @override
  factory LedgerCurrentResponse.fromRpcJson(Map<String, dynamic> json) {
    return LedgerCurrentResponse(
      result: LedgerResultResponse.fromJson(json),
    );
  }

  @override
  factory LedgerCurrentResponse.fromWebSocketJson(Map<String, dynamic> json) {
    return LedgerCurrentResponse(
      result: LedgerResultResponse.fromJson(json),
      id: json['id'],
    );
  }
}

class LedgerResultResponse {
  /// The Ledger Index of this ledger.
  int ledgerIndex;

  LedgerResultResponse({
    required this.ledgerIndex,
  });

  factory LedgerResultResponse.fromJson(Map<String, dynamic> json) {
    return LedgerResultResponse(
      ledgerIndex: json['ledger_current_index'],
    );
  }
}
