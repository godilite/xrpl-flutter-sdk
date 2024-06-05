import 'package:xrpl_flutter_sdk/src/client/interfaces/xrp_response.dart';

class LedgerResponse implements XrpResponse {
  /// id of the request that prompted this response (only for websocket requests)
  dynamic id;

  /// The result of the ledger request.
  LedgerResultResponse result;

  LedgerResponse({
    required this.result,
    this.id,
  });

  @override
  factory LedgerResponse.fromWebSocketJson(Map<String, dynamic> json) {
    return LedgerResponse(
      result: LedgerResultResponse.fromJson(json['result']),
      id: json['id'],
    );
  }

  @override
  factory LedgerResponse.fromRpcJson(Map<String, dynamic> json) {
    return LedgerResponse(
      result: LedgerResultResponse.fromJson(json['result']),
    );
  }
}

class LedgerResultResponse {
  /// The complete ledger header data of this ledger, with some additional fields added for convenience.
  LedgerHeader ledger;

  /// The unique identifying hash of the entire ledger, as hexadecimal.
  String ledgerHash;

  /// The Ledger Index of this ledger.
  int ledgerIndex;

  /// If true, this is a validated ledger version. If omitted or set to false, this ledger's data is not final.
  bool validated;

  /// (Omitted unless requested with the queue parameter) Array of objects describing queued transactions, in the same order as the queue. If the request specified expand as true, members contain full representations of the transactions, in either JSON or binary depending on whether the request specified binary as true.
  QueueData? queueData;

  LedgerResultResponse({
    required this.ledger,
    required this.ledgerHash,
    required this.ledgerIndex,
    required this.validated,
    this.queueData,
  });

  factory LedgerResultResponse.fromJson(Map<String, dynamic> json) {
    return LedgerResultResponse(
      ledger: LedgerHeader.fromMap(json['ledger']),
      ledgerHash: json['ledger_hash'],
      ledgerIndex: json['ledger_index'],
      validated: json['validated'],
    );
  }
}

class LedgerHeader {
  /// Hash of all account state information in this ledger, as hexadecimal.
  String accountHash;

  /// A bit-map of flags relating to the closing of this ledger.
  int closeFlags;

  /// The time this ledger was closed, in seconds since the Ripple Epoch.
  int closeTime;

  /// The time this ledger was closed, in human-readable format. Always uses the UTC time zone.
  String closeTimeHuman;

  /// Ledger close times are rounded to within this many seconds.
  int closeTimeResolution;

  /// Whether or not this ledger has been closed.
  bool closed;

  /// Unique identifying hash of the entire ledger.
  String ledgerHash;

  /// The Ledger Index of this ledger, as a quoted integer.
  String ledgerIndex;

  /// The time at which the previous ledger was closed.
  int parentCloseTime;

  /// The unique identifying hash of the ledger that came immediately before this one, as hexadecimal.
  String parentHash;

  /// Total number of XRP drops in the network, as a quoted integer. (This decreases as transaction costs destroy XRP.)
  String totalCoins;

  /// Hash of the transaction information included in this ledger.
  String transactionHash;

  LedgerHeader({
    required this.accountHash,
    required this.closeFlags,
    required this.closeTime,
    required this.closeTimeHuman,
    required this.closeTimeResolution,
    required this.closed,
    required this.ledgerHash,
    required this.ledgerIndex,
    required this.parentCloseTime,
    required this.parentHash,
    required this.totalCoins,
    required this.transactionHash,
  });

  factory LedgerHeader.fromMap(Map<String, dynamic> json) {
    return LedgerHeader(
      accountHash: json['account_hash'],
      closeFlags: json['close_flags'],
      closeTime: json['close_time'],
      closeTimeHuman: json['close_time_human'],
      closeTimeResolution: json['close_time_resolution'],
      closed: json['closed'],
      ledgerHash: json['ledger_hash'],
      ledgerIndex: json['ledger_index'],
      parentCloseTime: json['parent_close_time'],
      parentHash: json['parent_hash'],
      totalCoins: json['total_coins'],
      transactionHash: json['transaction_hash'],
    );
  }
}

class QueueData {
  /// The Address of the sender for this queued transaction.
  String account;

  /// By default, this is a String containing the identifying hash of the transaction. If transactions are expanded in binary format, this is an object whose only field is tx_blob, containing the binary form of the transaction as a decimal string. If transactions are expanded in JSON format, this is an object containing the transaction object including the transaction's identifying hash in the hash field.
  dynamic tx;

  /// How many times this transaction can be retried before being dropped.
  int retriesRemaining;

  /// The tentative result from preliminary transaction checking. This is always tesSUCCESS.
  String preflightResult;

  /// If this transaction was left in the queue after getting a retriable (ter) result, this is the exact ter result code it got.
  String? lastResult;

  /// Whether this transaction changes this address's ways of authorizing transactions.
  bool authChange;

  /// The Transaction Cost of this transaction, in drops of XRP.
  String? fee;

  /// The transaction cost of this transaction, relative to the minimum cost for this type of transaction, in fee levels.
  String? feeLevel;

  /// The maximum amount of XRP, in drops, this transaction could potentially send or destroy.
  String? maxSpendDrops;

  /// If the request specified "owner_funds": true and expanded transactions, the response has a field owner_funds in the metaData object of each OfferCreate transaction. The purpose of this field is to make it easier to track the funding status of offers with each new validated ledger. This field is defined slightly differently than the version of this field in Order Book subscription streams:
  /// Numeric amount of the TakerGets currency that the Account sending this OfferCreate transaction has after the execution of all transactions in this ledger. This does not check whether the currency amount is frozen.
  String? ownerFunds;

  QueueData({
    required this.account,
    required this.tx,
    required this.retriesRemaining,
    required this.preflightResult,
    required this.authChange,
    this.lastResult,
    this.fee,
    this.feeLevel,
    this.maxSpendDrops,
    this.ownerFunds,
  });

  factory QueueData.fromMap(Map<String, dynamic> json) {
    return QueueData(
      account: json['account'],
      tx: json['tx'],
      retriesRemaining: json['retries_remaining'],
      preflightResult: json['preflight_result'],
      authChange: json['auth_change'],
      lastResult: json['last_result'],
      fee: json['fee'],
      feeLevel: json['fee_level'],
      maxSpendDrops: json['max_spend_drops'],
      ownerFunds: json['owner_funds'],
    );
  }
}
