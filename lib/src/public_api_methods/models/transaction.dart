class Transaction {
  /// The Address of the sender for this queued transaction.
  final String account;

  /// By default, this is a String containing the identifying hash of the transaction.
  /// If transactions are expanded in binary format, this is an object whose only field is tx_blob,
  /// containing the binary form of the transaction as a decimal string.
  /// If transactions are expanded in JSON format, this is an object containing the transaction
  /// object including the transaction's identifying hash in the hash field.
  final dynamic tx;

  /// How many times this transaction can be retried before being dropped.
  final int retriesRemaining;

  /// The tentative result from preliminary transaction checking. This is always tesSUCCESS.
  final String preflightResult;

  /// (Optional) If this transaction was left in the queue after getting a retriable (ter) result,
  /// this is the exact ter result code it got.
  final String? lastResult;

  /// (Optional) Whether this transaction changes this address's ways of authorizing transactions.
  final bool? authChange;

  /// (Optional) The Transaction Cost of this transaction, in drops of XRP.
  final String? fee;

  /// (Optional) The transaction cost of this transaction, relative to the minimum cost for this type
  /// of transaction, in fee levels.
  final String? feeLevel;

  /// (Optional) The maximum amount of XRP, in drops, this transaction could potentially send or destroy.
  final String? maxSpendDrops;

  Transaction({
    required this.account,
    required this.tx,
    required this.retriesRemaining,
    required this.preflightResult,
    this.lastResult,
    this.authChange,
    this.fee,
    this.feeLevel,
    this.maxSpendDrops,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      account: json['account'] as String? ?? '',
      tx: json['tx'],
      retriesRemaining: json['retries_remaining'] as int? ?? 0,
      preflightResult: json['preflight_result'] as String? ?? '',
      lastResult: json['last_result'] as String?,
      authChange: json['auth_change'] as bool?,
      fee: json['fee'] as String?,
      feeLevel: json['fee_level'] as String?,
      maxSpendDrops: json['max_spend_drops'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'account': account,
      'tx': tx,
      'retries_remaining': retriesRemaining,
      'preflight_result': preflightResult,
      'last_result': lastResult,
      'auth_change': authChange,
      'fee': fee,
      'fee_level': feeLevel,
      'max_spend_drops': maxSpendDrops,
    };
  }
}
