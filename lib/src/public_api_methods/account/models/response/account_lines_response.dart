import 'package:xrpl_flutter_sdk/xrpl_flutter_sdk.dart';

class AccountLinesResponse implements XrpResponse {
  /// id of the request that prompted this response (only for websocket requests)
  final String? id;
  final AccountLinesResultResponse result;

  const AccountLinesResponse({
    this.id,
    required this.result,
  });

  @override
  factory AccountLinesResponse.fromRpcJson(Map<String, dynamic> json) {
    return AccountLinesResponse(
      result: AccountLinesResultResponse.fromJson(json),
    );
  }

  @override
  factory AccountLinesResponse.fromWebSocketJson(Map<String, dynamic> json) {
    return AccountLinesResponse(
      id: json['id'],
      result: AccountLinesResultResponse.fromJson(json),
    );
  }
}

class TrustLine {
  /// The unique Address of the counterparty to this trust line.
  final String account;

  /// Representation of the numeric balance currently held against this line.
  /// A positive balance means that the perspective account holds value;
  /// a negative balance means that the perspective account owes value.
  final String balance;

  /// A Currency Code identifying what currency this trust line can hold.
  final String currency;

  /// The maximum amount of the given currency that this account is willing to owe the peer account.
  final String limit;

  /// The maximum amount of currency that the counterparty account is willing to owe the perspective account.
  final String limitPeer;

  /// Rate at which the account values incoming balances on this trust line, as a ratio of this value per 1 billion units.
  /// (For example, a value of 500 million represents a 0.5:1 ratio.) As a special case, 0 is treated as a 1:1 ratio.
  final int qualityIn;

  /// Rate at which the account values outgoing balances on this trust line, as a ratio of this value per 1 billion units.
  /// (For example, a value of 500 million represents a 0.5:1 ratio.) As a special case, 0 is treated as a 1:1 ratio.
  final int qualityOut;

  /// (May be omitted) If true, this account has enabled the No Ripple flag for this trust line.
  final bool? noRipple;

  /// (May be omitted) If true, the peer account has enabled the No Ripple flag for this trust line.
  final bool? noRipplePeer;

  /// (May be omitted) If true, this account has authorized this trust line.
  final bool? authorized;

  /// (May be omitted) If true, the peer account has authorized this trust line.
  final bool? peerAuthorized;

  /// (May be omitted) If true, this account has frozen this trust line.
  final bool? freeze;

  /// (May be omitted) If true, the peer account has frozen this trust line.
  final bool? freezePeer;

  const TrustLine({
    required this.account,
    required this.balance,
    required this.currency,
    required this.limit,
    required this.limitPeer,
    required this.qualityIn,
    required this.qualityOut,
    this.noRipple,
    this.noRipplePeer,
    this.authorized,
    this.peerAuthorized,
    this.freeze,
    this.freezePeer,
  });

  factory TrustLine.fromJson(Map<String, dynamic> json) {
    return TrustLine(
      account: json['account'] as String? ?? '',
      balance: json['balance'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      limit: json['limit'] as String? ?? '',
      limitPeer: json['limit_peer'] as String? ?? '',
      qualityIn: json['quality_in'] as int? ?? 0,
      qualityOut: json['quality_out'] as int? ?? 0,
      noRipple: json['no_ripple'] as bool?,
      noRipplePeer: json['no_ripple_peer'] as bool?,
      authorized: json['authorized'] as bool?,
      peerAuthorized: json['peer_authorized'] as bool?,
      freeze: json['freeze'] as bool?,
      freezePeer: json['freeze_peer'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'account': account,
      'balance': balance,
      'currency': currency,
      'limit': limit,
      'limit_peer': limitPeer,
      'quality_in': qualityIn,
      'quality_out': qualityOut,
      'no_ripple': noRipple,
      'no_ripple_peer': noRipplePeer,
      'authorized': authorized,
      'peer_authorized': peerAuthorized,
      'freeze': freeze,
      'freeze_peer': freezePeer,
    };
  }
}

class AccountLinesResultResponse {
  /// Unique Address of the account this request corresponds to.
  final String account;

  /// Array of trust line objects, as described below. If the number of trust lines is large, only returns up to the limit at a time.
  final List<TrustLine> lines;

  /// (Omitted if ledger_hash or ledger_index provided) The ledger index of the current open ledger, which was used when retrieving this information.
  final int? ledgerCurrentIndex;

  /// (Omitted if ledger_current_index provided instead) The ledger index of the ledger version that was used when retrieving this data.
  final int? ledgerIndex;

  /// (May be omitted) The identifying hash the ledger version that was used when retrieving this data.
  final String? ledgerHash;

  /// Server-defined value indicating the response is paginated. Pass this to the next call to resume where this call left off. Omitted when there are no additional pages after this one.
  final String? marker;

  const AccountLinesResultResponse({
    required this.account,
    required this.lines,
    this.ledgerCurrentIndex,
    this.ledgerIndex,
    this.ledgerHash,
    this.marker,
  });

  factory AccountLinesResultResponse.fromJson(Map<String, dynamic> json) {
    var lines = (json['lines'] as List).map((line) => TrustLine.fromJson(line)).toList();

    return AccountLinesResultResponse(
      account: json['account'] as String? ?? '',
      lines: lines,
      ledgerCurrentIndex: json['ledger_current_index'] as int?,
      ledgerIndex: json['ledger_index'] as int?,
      ledgerHash: json['ledger_hash'] as String?,
      marker: json['marker'] as String?,
    );
  }
}
