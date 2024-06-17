import 'package:xrpl_flutter_sdk/xrpl_flutter_sdk.dart';

class AccountObjectsResponse implements XrpResponse {
  /// (Optional) A unique identifier for the request, which is included in the response.
  final String? id;

  /// The result of the account_objects request.
  final AccountObjectsResultResponse result;

  AccountObjectsResponse({
    required this.result,
    this.id,
  });

  @override
  factory AccountObjectsResponse.fromRpcJson(Map<String, dynamic> json) {
    return AccountObjectsResponse(
      result: AccountObjectsResultResponse.fromJson(json),
    );
  }

  @override
  factory AccountObjectsResponse.fromWebSocketJson(Map<String, dynamic> json) {
    return AccountObjectsResponse(
      id: json['id'] as String?,
      result: AccountObjectsResultResponse.fromJson(json['result']),
    );
  }
}

/// Represents a response object for account objects result.
class AccountObjectsResultResponse {
  final String account;
  final List<LedgerEntry> accountObjects;
  final String? ledgerHash;
  final int? ledgerIndex;
  final int? ledgerCurrentIndex;
  final int? limit;
  final dynamic marker;
  final bool validated;

  /// Constructs an AccountObjectsResultResponse object.
  const AccountObjectsResultResponse({
    required this.account,
    required this.accountObjects,
    this.ledgerHash,
    this.ledgerIndex,
    this.ledgerCurrentIndex,
    this.limit,
    this.marker,
    required this.validated,
  });

  /// Constructs an AccountObjectsResultResponse object from a JSON map.
  factory AccountObjectsResultResponse.fromJson(Map<String, dynamic> json) {
    return AccountObjectsResultResponse(
      account: json['account'],
      accountObjects: (json['account_objects'] as List<dynamic>).map((e) => LedgerEntry.fromJson(e)).toList(),
      ledgerHash: json['ledger_hash'],
      ledgerIndex: json['ledger_index'],
      ledgerCurrentIndex: json['ledger_current_index'],
      limit: json['limit'],
      marker: json['marker'],
      validated: json['validated'] ?? false,
    );
  }
}
