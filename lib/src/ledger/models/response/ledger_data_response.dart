import 'package:xrpl_flutter_sdk/src/client/interfaces/xrp_response.dart';

class LedgerDataResponse implements XrpResponse {
  /// id of the request that prompted this response (only for websocket requests)
  final String? id;
  final LedgerDataResultResponse result;

  LedgerDataResponse({
    this.id,
    required this.result,
  });

  @override
  factory LedgerDataResponse.fromRpcJson(Map<String, dynamic> json) {
    return LedgerDataResponse(
      result: LedgerDataResultResponse.fromJson(json),
    );
  }

  @override
  factory LedgerDataResponse.fromWebSocketJson(Map<String, dynamic> json) {
    return LedgerDataResponse(
      id: json['id'],
      result: LedgerDataResultResponse.fromJson(json),
    );
  }
}

class LedgerDataResultResponse {
  /// The unique identifying hash of the entire ledger, as hexadecimal.
  final String ledgerHash;

  /// The Ledger Index of this ledger.
  final String ledgerIndex;

  /// A string that indicates the last record retrieved in the response. This value is used in the marker field of the request to get the next set of records.
  final String marker;

  /// An array of ledger objects, each of which represents a single ledger object.
  final List<LedgerState> state;

  LedgerDataResultResponse({
    required this.ledgerHash,
    required this.ledgerIndex,
    required this.marker,
    required this.state,
  });

  factory LedgerDataResultResponse.fromJson(Map<String, dynamic> json) {
    return LedgerDataResultResponse(
      ledgerHash: json['ledger_hash'],
      ledgerIndex: json['ledger_index'],
      marker: json['marker'],
      state: (json['state'] as List<dynamic>).map((e) => LedgerState.fromJson(e)).toList(),
    );
  }
}

class LedgerState {
  /// (Optional) A string of data that the owner of the account can use to identify it.
  final String? data;

  /// The unique identifying hash of the entire ledger, as hexadecimal.
  final String? index;

  /// The type of ledger object, which indicates the type of data this object contains.
  final String? ledgerEntryType;

  /// The unique address of the account that owns this ledger object.
  final String? account;

  /// The current balance of the account, as a string.
  final String? balance;

  /// A bit-map of boolean flags enabled for this ledger object.
  final int? flags;

  /// The number of objects owned by this account.
  final int? ownerCount;

  /// The identifying hash of the transaction that most recently modified this object.
  final String? previousTxnID;

  /// The index of the ledger that contains the transaction that most recently modified this object.
  final int? previousTxnLgrSeq;

  /// The sequence number of this object, relative to other objects owned by the same account.
  final int? sequence;

  /// The identifying hash of the directory containing this order book.
  final String? bookDirectory;

  /// The index of the node in the directory containing this order book.
  final String? bookNode;

  /// The index of the node in the directory containing this order book.
  final String? ownerNode;

  /// The currency, issuer, and value of the currency that the account taking the offer will give.
  final String? takerGets;

  /// The currency, issuer, and value of the currency that the account taking the offer will receive.
  final TakerPays? takerPays;

  /// The balance of the account, as a string.
  final Balance? balanceObj;

  /// The index of the high limit in the directory containing this order book.
  final Limit? highLimit;

  /// The index of the high node in the directory containing this order book.
  final String? highNode;

  /// The index of the low limit in the directory containing this order book.
  final Limit? lowLimit;

  /// The index of the low node in the directory containing this order book.
  final String? lowNode;

  LedgerState({
    this.data,
    this.index,
    this.ledgerEntryType,
    this.account,
    this.balance,
    this.flags,
    this.ownerCount,
    this.previousTxnID,
    this.previousTxnLgrSeq,
    this.sequence,
    this.bookDirectory,
    this.bookNode,
    this.ownerNode,
    this.takerGets,
    this.takerPays,
    this.balanceObj,
    this.highLimit,
    this.highNode,
    this.lowLimit,
    this.lowNode,
  });

  factory LedgerState.fromJson(Map<String, dynamic> json) {
    return LedgerState(
      data: json['data'],
      index: json['index'],
      ledgerEntryType: json['LedgerEntryType'],
      account: json['Account'],
      balance: json['Balance'],
      flags: json['Flags'],
      ownerCount: json['OwnerCount'],
      previousTxnID: json['PreviousTxnID'],
      previousTxnLgrSeq: json['PreviousTxnLgrSeq'],
      sequence: json['Sequence'],
      bookDirectory: json['BookDirectory'],
      bookNode: json['BookNode'],
      ownerNode: json['OwnerNode'],
      takerGets: json['TakerGets'],
      takerPays: json['TakerPays'] != null ? TakerPays.fromJson(json['TakerPays']) : null,
      balanceObj: json['Balance'] != null && json['Balance'] is Map ? Balance.fromJson(json['Balance']) : null,
      highLimit: json['HighLimit'] != null ? Limit.fromJson(json['HighLimit']) : null,
      highNode: json['HighNode'],
      lowLimit: json['LowLimit'] != null ? Limit.fromJson(json['LowLimit']) : null,
      lowNode: json['LowNode'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data;
    }
    if (index != null) {
      data['index'] = index;
    }
    if (ledgerEntryType != null) {
      data['LedgerEntryType'] = ledgerEntryType;
    }
    if (account != null) {
      data['Account'] = account;
    }
    if (balance != null) {
      data['Balance'] = balance;
    }
    if (flags != null) {
      data['Flags'] = flags;
    }
    if (ownerCount != null) {
      data['OwnerCount'] = ownerCount;
    }
    if (previousTxnID != null) {
      data['PreviousTxnID'] = previousTxnID;
    }
    if (previousTxnLgrSeq != null) {
      data['PreviousTxnLgrSeq'] = previousTxnLgrSeq;
    }
    if (sequence != null) {
      data['Sequence'] = sequence;
    }
    if (bookDirectory != null) {
      data['BookDirectory'] = bookDirectory;
    }
    if (bookNode != null) {
      data['BookNode'] = bookNode;
    }
    if (ownerNode != null) {
      data['OwnerNode'] = ownerNode;
    }
    if (takerGets != null) {
      data['TakerGets'] = takerGets;
    }
    if (takerPays != null) {
      data['TakerPays'] = takerPays?.toJson();
    }
    if (balanceObj != null) {
      data['Balance'] = balanceObj?.toJson();
    }
    if (highLimit != null) {
      data['HighLimit'] = highLimit?.toJson();
    }
    if (highNode != null) {
      data['HighNode'] = highNode;
    }
    if (lowLimit != null) {
      data['LowLimit'] = lowLimit?.toJson();
    }
    if (lowNode != null) {
      data['LowNode'] = lowNode;
    }
    return data;
  }
}

class TakerPays {
  final String currency;
  final String issuer;
  final String value;

  TakerPays({
    required this.currency,
    required this.issuer,
    required this.value,
  });

  factory TakerPays.fromJson(Map<String, dynamic> json) {
    return TakerPays(
      currency: json['currency'],
      issuer: json['issuer'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'issuer': issuer,
      'value': value,
    };
  }
}

class Balance {
  final String currency;
  final String issuer;
  final String value;

  Balance({
    required this.currency,
    required this.issuer,
    required this.value,
  });

  factory Balance.fromJson(Map<String, dynamic> json) {
    return Balance(
      currency: json['currency'],
      issuer: json['issuer'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'issuer': issuer,
      'value': value,
    };
  }
}

class Limit {
  final String currency;
  final String issuer;
  final String value;

  Limit({
    required this.currency,
    required this.issuer,
    required this.value,
  });

  factory Limit.fromJson(Map<String, dynamic> json) {
    return Limit(
      currency: json['currency'],
      issuer: json['issuer'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'issuer': issuer,
      'value': value,
    };
  }
}
