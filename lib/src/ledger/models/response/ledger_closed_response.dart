import 'package:xrpl_flutter_sdk/src/client/interfaces/xrp_response.dart';

class LedgerClosedResponse implements XrpResponse {
  /// id of the request that prompted this response (only for websocket requests)
  dynamic id;

  LedgerClosedResultResponse result;

  LedgerClosedResponse({
    required this.result,
    this.id,
  });

  @override
  factory LedgerClosedResponse.fromRpcJson(Map<String, dynamic> json) {
    return LedgerClosedResponse(
      result: LedgerClosedResultResponse.toJson(json),
    );
  }

  @override
  factory LedgerClosedResponse.fromWebSocketJson(Map<String, dynamic> json) {
    return LedgerClosedResponse(
      result: LedgerClosedResultResponse.toJson(json),
      id: json['id'],
    );
  }
}

class LedgerClosedResultResponse {
  /// The unique identifying hash of the entire ledger, as hexadecimal.
  String ledgerHash;

  /// The Ledger Index of this ledger.
  int ledgerIndex;

  LedgerClosedResultResponse({
    required this.ledgerHash,
    required this.ledgerIndex,
  });

  factory LedgerClosedResultResponse.toJson(Map<String, dynamic> json) {
    return LedgerClosedResultResponse(
      ledgerHash: json['result']['ledger_hash'],
      ledgerIndex: json['result']['ledger_index'],
    );
  }
}
