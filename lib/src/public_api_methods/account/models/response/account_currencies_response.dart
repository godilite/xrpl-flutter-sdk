import 'package:xrpl_flutter_sdk/xrpl_flutter_sdk.dart';

class AccountCurrenciesResponse implements XrpResponse {
  /// (Optional) The unique identifier for the response. This is used for debugging and correlating responses and requests.
  dynamic id;

  AccountCurrenciesResultResponse result;

  AccountCurrenciesResponse({
    required this.result,
    this.id,
  });

  @override
  factory AccountCurrenciesResponse.fromRpcJson(Map<String, dynamic> json) {
    return AccountCurrenciesResponse(
      result: AccountCurrenciesResultResponse.toJson(json),
    );
  }

  @override
  factory AccountCurrenciesResponse.fromWebSocketJson(Map<String, dynamic> json) {
    return AccountCurrenciesResponse(
      result: AccountCurrenciesResultResponse.toJson(json),
      id: json['id'],
    );
  }
}

/// Note: The currencies that an account can send or receive are defined based on a check of its trust lines. If an account has a trust line for a currency and enough room to increase its balance, it can receive that currency.
/// If the trust line's balance can go down, the account can send that currency.
/// This method doesn't check whether the trust line is frozen or authorized.
class AccountCurrenciesResultResponse {
  ///  Hash	(May be omitted) The identifying hash of the ledger version used to retrieve this data, as hex.
  final String? ledgerHash;

  /// The ledger index of the ledger version used to retrieve this data.
  final int ledgerIndex;

  /// Array of Currency Codes for currencies that this account can receive.
  final List<String> receiveCurrencies;

  /// Array of Currency Codes for currencies that this account can send.
  final List<String> sendCurrencies;

  /// If true, this data comes from a validated ledger.
  final bool validated;

  AccountCurrenciesResultResponse({
    required this.ledgerHash,
    required this.ledgerIndex,
    required this.receiveCurrencies,
    required this.sendCurrencies,
    required this.validated,
  });

  factory AccountCurrenciesResultResponse.toJson(Map<String, dynamic> json) {
    return AccountCurrenciesResultResponse(
      ledgerHash: json['result']['ledger_hash'],
      ledgerIndex: json['result']['ledger_index'],
      receiveCurrencies: List<String>.from(json['result']['receive_currencies']),
      sendCurrencies: List<String>.from(json['result']['send_currencies']),
      validated: json['result']['validated'],
    );
  }
}
