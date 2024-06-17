/// Base sealed class representing a ledger entry.
sealed class LedgerEntry {
  const LedgerEntry();

  /// Factory method to create a [LedgerEntry] from a JSON object.
  factory LedgerEntry.fromJson(Map<String, dynamic> json) {
    switch (json['LedgerEntryType']) {
      case 'AccountRoot':
        return AccountRoot.fromJson(json);
      case 'Amendments':
        return Amendments.fromJson(json);
      case 'AMM':
        return AMM.fromJson(json);
      case 'Bridge':
        return Bridge.fromJson(json);
      case 'Check':
        return Check.fromJson(json);
      case 'DepositPreauth':
        return DepositPreauth.fromJson(json);
      case 'DID':
        return DID.fromJson(json);
      case 'DirectoryNode':
        return DirectoryNode.fromJson(json);
      case 'Offer':
        return Offer.fromJson(json);
      case 'LedgerHashes':
        return LedgerHashes.fromJson(json);
      case 'PayChannel':
        return PayChannel.fromJson(json);
      case 'Escrow':
        return Escrow.fromJson(json);
      case 'FeeSettings':
        return FeeSettings.fromJson(json);
      case 'NegativeUNL':
        return NegativeUNL.fromJson(json);
      case 'NFTokenOffer':
        return NFTokenOffer.fromJson(json);
      case 'NFTokenPage':
        return NFTokenPage.fromJson(json);
      case 'RippleState':
        return RippleState.fromJson(json);
      case 'SignerList':
        return SignerList.fromJson(json);
      case 'Ticket':
        return Ticket.fromJson(json);
      case 'XChainOwnedClaimID':
        return XChainOwnedClaimID.fromJson(json);
      case 'XChainOwnedCreateAccountClaimID':
        return XChainOwnedCreateAccountClaimID.fromJson(json);
      default:
        throw Exception('Unknown LedgerEntryType: ${json['LedgerEntryType']}');
    }
  }

  Map<String, dynamic> toJson();
}

/// An [AccountRoot] ledger entry type describes a single account, its settings, and XRP balance.
class AccountRoot extends LedgerEntry {
  final String account;
  final String? accountTxnID;
  final String balance;
  final String? domain;
  final String? emailHash;
  final int flags;
  final String ledgerEntryType;
  final String? messageKey;
  final int ownerCount;
  final String previousTxnID;
  final int previousTxnLgrSeq;
  final int sequence;
  final int? transferRate;
  final String index;

  /// Constructs an [AccountRoot] instance with the given fields.
  AccountRoot({
    required this.account,
    this.accountTxnID,
    required this.balance,
    this.domain,
    this.emailHash,
    required this.flags,
    required this.ledgerEntryType,
    this.messageKey,
    required this.ownerCount,
    required this.previousTxnID,
    required this.previousTxnLgrSeq,
    required this.sequence,
    this.transferRate,
    required this.index,
  }) : super();

  /// Factory method to create an [AccountRoot] instance from a JSON object.
  factory AccountRoot.fromJson(Map<String, dynamic> json) {
    return AccountRoot(
      account: json['Account'] ?? '',
      accountTxnID: json['AccountTxnID'],
      balance: json['Balance'] ?? '',
      domain: json['Domain'],
      emailHash: json['EmailHash'],
      flags: json['Flags'] ?? 0,
      ledgerEntryType: json['LedgerEntryType'] ?? 'AccountRoot',
      messageKey: json['MessageKey'],
      ownerCount: json['OwnerCount'] ?? 0,
      previousTxnID: json['PreviousTxnID'] ?? '',
      previousTxnLgrSeq: json['PreviousTxnLgrSeq'] ?? 0,
      sequence: json['Sequence'] ?? 0,
      transferRate: json['TransferRate'],
      index: json['index'] ?? '',
    );
  }

  /// Method to convert an [AccountRoot] instance to a JSON object.
  @override
  Map<String, dynamic> toJson() {
    return {
      'Account': account,
      'AccountTxnID': accountTxnID,
      'Balance': balance,
      'Domain': domain,
      'EmailHash': emailHash,
      'Flags': flags,
      'LedgerEntryType': ledgerEntryType,
      'MessageKey': messageKey,
      'OwnerCount': ownerCount,
      'PreviousTxnID': previousTxnID,
      'PreviousTxnLgrSeq': previousTxnLgrSeq,
      'Sequence': sequence,
      'TransferRate': transferRate,
      'index': index,
    };
  }
}

/// Class representing an Amendments ledger entry.
class Amendments extends LedgerEntry {
  final List<String> amendments;
  final List<AmendmentMajority>? majorities;
  final int flags;
  final String ledgerEntryType;
  final String index;

  /// Constructs an [Amendments] instance with the given fields.
  Amendments({
    required this.amendments,
    this.majorities,
    required this.flags,
    required this.ledgerEntryType,
    required this.index,
  }) : super();

  /// Factory method to create an [Amendments] instance from a JSON object.
  factory Amendments.fromJson(Map<String, dynamic> json) {
    List<String> amendments = (json['Amendments'] as List<dynamic>).cast<String>();
    List<AmendmentMajority>? majorities;
    if (json.containsKey('Majorities')) {
      majorities = (json['Majorities'] as List<dynamic>).map((e) => AmendmentMajority.fromJson(e['Majority'])).toList();
    }

    return Amendments(
      amendments: amendments,
      majorities: majorities,
      flags: json['Flags'] ?? 0,
      ledgerEntryType: json['LedgerEntryType'] ?? 'Amendments',
      index: json['index'] ?? '',
    );
  }

  /// Method to convert an [Amendments] instance to a JSON object.
  @override
  Map<String, dynamic> toJson() {
    return {
      'Amendments': amendments,
      if (majorities != null) 'Majorities': majorities!.map((e) => {'Majority': e.toJson()}).toList(),
      'Flags': flags,
      'LedgerEntryType': ledgerEntryType,
      'index': index,
    };
  }
}

/// Class representing the Majority of an Amendment in Amendments.
class AmendmentMajority {
  final String amendment;
  final int closeTime;

  /// Constructs an [AmendmentMajority] instance with the given fields.
  AmendmentMajority({
    required this.amendment,
    required this.closeTime,
  });

  /// Factory method to create an [AmendmentMajority] instance from a JSON object.
  factory AmendmentMajority.fromJson(Map<String, dynamic> json) {
    return AmendmentMajority(
      amendment: json['Amendment'] ?? '',
      closeTime: json['CloseTime'] ?? 0,
    );
  }

  /// Method to convert an [AmendmentMajority] instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'Amendment': amendment,
      'CloseTime': closeTime,
    };
  }
}

/// Class representing an AMM (Automated Market Maker) ledger entry.
class AMM extends LedgerEntry {
  final String account;
  final Asset asset;
  final Asset asset2;
  final AuctionSlot? auctionSlot;
  final CurrencyAmount lpTokenBalance;
  final int tradingFee;
  final List<VoteEntry>? voteSlots;
  final int flags; // Always 0 for AMM
  final String ledgerEntryType; // Always 'AMM'
  final String index;

  /// Constructs an [AMM] instance with the given fields.
  AMM({
    required this.account,
    required this.asset,
    required this.asset2,
    this.auctionSlot,
    required this.lpTokenBalance,
    required this.tradingFee,
    this.voteSlots,
    required this.flags,
    required this.ledgerEntryType,
    required this.index,
  }) : super();

  /// Factory method to create an [AMM] instance from a JSON object.
  factory AMM.fromJson(Map<String, dynamic> json) {
    return AMM(
      account: json['Account'],
      asset: Asset.fromJson(json['Asset']),
      asset2: Asset.fromJson(json['Asset2']),
      auctionSlot: json.containsKey('AuctionSlot') ? AuctionSlot.fromJson(json['AuctionSlot']) : null,
      lpTokenBalance: CurrencyAmount.fromJson(json['LPTokenBalance']),
      tradingFee: json['TradingFee'],
      voteSlots: json.containsKey('VoteSlots')
          ? (json['VoteSlots'] as List<dynamic>).map((e) => VoteEntry.fromJson(e['VoteEntry'])).toList()
          : null,
      flags: json['Flags'] ?? 0,
      ledgerEntryType: json['LedgerEntryType'] ?? 'AMM',
      index: json['index'] ?? '',
    );
  }

  /// Method to convert an [AMM] instance to a JSON object.
  @override
  Map<String, dynamic> toJson() {
    return {
      'Account': account,
      'Asset': asset.toJson(),
      'Asset2': asset2.toJson(),
      if (auctionSlot != null) 'AuctionSlot': auctionSlot!.toJson(),
      'LPTokenBalance': lpTokenBalance.toJson(),
      'TradingFee': tradingFee,
      if (voteSlots != null) 'VoteSlots': voteSlots!.map((e) => {'VoteEntry': e.toJson()}).toList(),
      'Flags': flags,
      'LedgerEntryType': ledgerEntryType,
      'index': index,
    };
  }
}

/// Class representing an asset with currency and issuer.
class Asset {
  final String currency;
  final String issuer;

  /// Constructs an [Asset] instance with the given fields.
  Asset({
    required this.currency,
    required this.issuer,
  });

  /// Factory method to create an [Asset] instance from a JSON object.
  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      currency: json['currency'],
      issuer: json['issuer'] ?? '',
    );
  }

  /// Method to convert an [Asset] instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'issuer': issuer,
    };
  }
}

/// Class representing details of the current auction slot owner.
class AuctionSlot {
  final String account;
  final List<AuthAccount>? authAccounts;
  final int discountedFee;
  final int expiration;
  final CurrencyAmount price;

  /// Constructs an [AuctionSlot] instance with the given fields.
  AuctionSlot({
    required this.account,
    this.authAccounts,
    required this.discountedFee,
    required this.expiration,
    required this.price,
  });

  /// Factory method to create an [AuctionSlot] instance from a JSON object.
  factory AuctionSlot.fromJson(Map<String, dynamic> json) {
    List<AuthAccount>? authAccounts;
    if (json.containsKey('AuthAccounts')) {
      authAccounts =
          (json['AuthAccounts'] as List<dynamic>).map((e) => AuthAccount.fromJson(e['AuthAccount'])).toList();
    }

    return AuctionSlot(
      account: json['Account'],
      authAccounts: authAccounts,
      discountedFee: json['DiscountedFee'],
      expiration: json['Expiration'],
      price: CurrencyAmount.fromJson(json['Price']),
    );
  }

  /// Method to convert an [AuctionSlot] instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'Account': account,
      if (authAccounts != null) 'AuthAccounts': authAccounts!.map((e) => {'AuthAccount': e.toJson()}).toList(),
      'DiscountedFee': discountedFee,
      'Expiration': expiration,
      'Price': price.toJson(),
    };
  }
}

/// Class representing an authorization account.
class AuthAccount {
  final String account;

  /// Constructs an [AuthAccount] instance with the given fields.
  AuthAccount({
    required this.account,
  });

  /// Factory method to create an [AuthAccount] instance from a JSON object.
  factory AuthAccount.fromJson(Map<String, dynamic> json) {
    return AuthAccount(
      account: json['Account'],
    );
  }

  /// Method to convert an [AuthAccount] instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'Account': account,
    };
  }
}

/// Class representing a vote entry for AMM.
class VoteEntry {
  final String account;
  final int tradingFee;
  final int voteWeight;

  /// Constructs a [VoteEntry] instance with the given fields.
  VoteEntry({
    required this.account,
    required this.tradingFee,
    required this.voteWeight,
  });

  /// Factory method to create a [VoteEntry] instance from a JSON object.
  factory VoteEntry.fromJson(Map<String, dynamic> json) {
    return VoteEntry(
      account: json['Account'],
      tradingFee: json['TradingFee'],
      voteWeight: json['VoteWeight'],
    );
  }

  /// Method to convert a [VoteEntry] instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'Account': account,
      'TradingFee': tradingFee,
      'VoteWeight': voteWeight,
    };
  }
}

/// Class representing a currency amount with currency, issuer, and value.
class CurrencyAmount {
  final String currency;
  final String issuer;
  final String value;

  /// Constructs a [CurrencyAmount] instance with the given fields.
  CurrencyAmount({
    required this.currency,
    required this.issuer,
    required this.value,
  });

  /// Factory method to create a [CurrencyAmount] instance from a JSON object.
  factory CurrencyAmount.fromJson(Map<String, dynamic> json) {
    return CurrencyAmount(
      currency: json['currency'] ?? '',
      issuer: json['issuer'] ?? '',
      value: json['value'] ?? '',
    );
  }

  /// Method to convert a [CurrencyAmount] instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'issuer': issuer,
      'value': value,
    };
  }
}

/// Class representing a Bridge ledger entry.
class Bridge extends LedgerEntry {
  final String account;
  final CurrencyAmount? minAccountCreateAmount;
  final CurrencyAmount signatureReward;
  final int xChainAccountClaimCount;
  final int xChainAccountCreateCount;
  final XChainBridge xChainBridge;
  final int xChainClaimID;
  final int flags; // Always 0 for Bridge
  final String ledgerEntryType; // Always 'Bridge'
  final String index;

  /// Constructs a [Bridge] instance with the given fields.
  Bridge({
    required this.account,
    this.minAccountCreateAmount,
    required this.signatureReward,
    required this.xChainAccountClaimCount,
    required this.xChainAccountCreateCount,
    required this.xChainBridge,
    required this.xChainClaimID,
    required this.flags,
    required this.ledgerEntryType,
    required this.index,
  }) : super();

  /// Factory method to create a [Bridge] instance from a JSON object.
  factory Bridge.fromJson(Map<String, dynamic> json) {
    return Bridge(
      account: json['Account'],
      minAccountCreateAmount:
          json.containsKey('MinAccountCreateAmount') ? CurrencyAmount.fromJson(json['MinAccountCreateAmount']) : null,
      signatureReward: CurrencyAmount.fromJson(json['SignatureReward']),
      xChainAccountClaimCount: json['XChainAccountClaimCount'],
      xChainAccountCreateCount: json['XChainAccountCreateCount'],
      xChainBridge: XChainBridge.fromJson(json['XChainBridge']),
      xChainClaimID: json['XChainClaimID'],
      flags: json['Flags'] ?? 0,
      ledgerEntryType: json['LedgerEntryType'] ?? 'Bridge',
      index: json['index'] ?? '',
    );
  }

  /// Method to convert a [Bridge] instance to a JSON object.
  @override
  Map<String, dynamic> toJson() {
    return {
      'Account': account,
      if (minAccountCreateAmount != null) 'MinAccountCreateAmount': minAccountCreateAmount!.toJson(),
      'SignatureReward': signatureReward.toJson(),
      'XChainAccountClaimCount': xChainAccountClaimCount,
      'XChainAccountCreateCount': xChainAccountCreateCount,
      'XChainBridge': xChainBridge.toJson(),
      'XChainClaimID': xChainClaimID,
      'Flags': flags,
      'LedgerEntryType': ledgerEntryType,
      'index': index,
    };
  }
}

/// Class representing the XChain bridge fields.
class XChainBridge {
  final String issuingChainDoor;
  final Issue issuingChainIssue;
  final String lockingChainDoor;
  final Issue lockingChainIssue;

  /// Constructs an [XChainBridge] instance with the given fields.
  XChainBridge({
    required this.issuingChainDoor,
    required this.issuingChainIssue,
    required this.lockingChainDoor,
    required this.lockingChainIssue,
  });

  /// Factory method to create an [XChainBridge] instance from a JSON object.
  factory XChainBridge.fromJson(Map<String, dynamic> json) {
    return XChainBridge(
      issuingChainDoor: json['IssuingChainDoor'],
      issuingChainIssue: Issue.fromJson(json['IssuingChainIssue']),
      lockingChainDoor: json['LockingChainDoor'],
      lockingChainIssue: Issue.fromJson(json['LockingChainIssue']),
    );
  }

  /// Method to convert an [XChainBridge] instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'IssuingChainDoor': issuingChainDoor,
      'IssuingChainIssue': issuingChainIssue.toJson(),
      'LockingChainDoor': lockingChainDoor,
      'LockingChainIssue': lockingChainIssue.toJson(),
    };
  }
}

/// Class representing an issue (asset definition).
class Issue {
  final String currency;
  final String issuer;

  /// Constructs an [Issue] instance with the given fields.
  Issue({
    required this.currency,
    required this.issuer,
  });

  /// Factory method to create an [Issue] instance from a JSON object.
  factory Issue.fromJson(Map<String, dynamic> json) {
    return Issue(
      currency: json['currency'],
      issuer: json['issuer'] ?? '',
    );
  }

  /// Method to convert an [Issue] instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'issuer': issuer,
    };
  }
}

/// Class representing a Check ledger entry.
class Check extends LedgerEntry {
  final String account;
  final String destination;
  final int? destinationNode;
  final int? destinationTag;
  final int? expiration;
  final String? invoiceID;
  final int flags; // Always 0 for Check
  final String ledgerEntryType; // Always 'Check'
  final int ownerNode;
  final String previousTxnID;
  final int previousTxnLgrSeq;
  final String sendMax;
  final int sequence;
  final int? sourceTag;
  final String index; // Ledger Index

  /// Constructs a [Check] instance with the given fields.
  Check({
    required this.account,
    required this.destination,
    this.destinationNode,
    this.destinationTag,
    this.expiration,
    this.invoiceID,
    required this.flags,
    required this.ledgerEntryType,
    required this.ownerNode,
    required this.previousTxnID,
    required this.previousTxnLgrSeq,
    required this.sendMax,
    required this.sequence,
    this.sourceTag,
    required this.index,
  }) : super();

  /// Factory method to create a [Check] instance from a JSON object.
  factory Check.fromJson(Map<String, dynamic> json) {
    return Check(
      account: json['Account'],
      destination: json['Destination'],
      destinationNode: json['DestinationNode'],
      destinationTag: json['DestinationTag'],
      expiration: json['Expiration'],
      invoiceID: json['InvoiceID'],
      flags: json['Flags'] ?? 0,
      ledgerEntryType: json['LedgerEntryType'] ?? 'Check',
      ownerNode: json['OwnerNode'],
      previousTxnID: json['PreviousTxnID'],
      previousTxnLgrSeq: json['PreviousTxnLgrSeq'],
      sendMax: json['SendMax'],
      sequence: json['Sequence'],
      sourceTag: json['SourceTag'],
      index: json['index'] ?? '',
    );
  }

  /// Method to convert a [Check] instance to a JSON object.
  @override
  Map<String, dynamic> toJson() {
    return {
      'Account': account,
      'Destination': destination,
      if (destinationNode != null) 'DestinationNode': destinationNode,
      if (destinationTag != null) 'DestinationTag': destinationTag,
      if (expiration != null) 'Expiration': expiration,
      if (invoiceID != null) 'InvoiceID': invoiceID,
      'Flags': flags,
      'LedgerEntryType': ledgerEntryType,
      'OwnerNode': ownerNode,
      'PreviousTxnID': previousTxnID,
      'PreviousTxnLgrSeq': previousTxnLgrSeq,
      'SendMax': sendMax,
      'Sequence': sequence,
      if (sourceTag != null) 'SourceTag': sourceTag,
      'index': index,
    };
  }
}

/// Class representing a DepositPreauth ledger entry.
class DepositPreauth extends LedgerEntry {
  final String account;
  final String authorize;
  final String ledgerEntryType; // Always 'DepositPreauth'
  final int ownerNode;
  final String previousTxnID;
  final int previousTxnLgrSeq;
  final String index; // Ledger Index

  /// Constructs a [DepositPreauth] instance with the given fields.
  DepositPreauth({
    required this.account,
    required this.authorize,
    required this.ledgerEntryType,
    required this.ownerNode,
    required this.previousTxnID,
    required this.previousTxnLgrSeq,
    required this.index,
  }) : super();

  /// Factory method to create a [DepositPreauth] instance from a JSON object.
  factory DepositPreauth.fromJson(Map<String, dynamic> json) {
    return DepositPreauth(
      account: json['Account'],
      authorize: json['Authorize'],
      ledgerEntryType: json['LedgerEntryType'] ?? 'DepositPreauth',
      ownerNode: json['OwnerNode'],
      previousTxnID: json['PreviousTxnID'],
      previousTxnLgrSeq: json['PreviousTxnLgrSeq'],
      index: json['index'] ?? '',
    );
  }

  /// Method to convert a [DepositPreauth] instance to a JSON object.
  @override
  Map<String, dynamic> toJson() {
    return {
      'Account': account,
      'Authorize': authorize,
      'LedgerEntryType': ledgerEntryType,
      'OwnerNode': ownerNode,
      'PreviousTxnID': previousTxnID,
      'PreviousTxnLgrSeq': previousTxnLgrSeq,
      'index': index,
    };
  }
}

/// Class representing a DID ledger entry.
class DID extends LedgerEntry {
  final String account;
  final String? didDocument;
  final String? data;
  final String ledgerEntryType; // Always 'DID'
  final int ownerNode;
  final String previousTxnID;
  final int previousTxnLgrSeq;
  final String? uri;

  /// Constructs a [DID] instance with the given fields.
  DID({
    required this.account,
    this.didDocument,
    this.data,
    required this.ledgerEntryType,
    required this.ownerNode,
    required this.previousTxnID,
    required this.previousTxnLgrSeq,
    this.uri,
  }) : super();

  /// Factory method to create a [DID] instance from a JSON object.
  factory DID.fromJson(Map<String, dynamic> json) {
    return DID(
      account: json['Account'],
      didDocument: json['DIDDocument'],
      data: json['Data'],
      ledgerEntryType: json['LedgerEntryType'] ?? 'DID',
      ownerNode: json['OwnerNode'],
      previousTxnID: json['PreviousTxnID'],
      previousTxnLgrSeq: json['PreviousTxnLgrSeq'],
      uri: json['URI'],
    );
  }

  /// Method to convert a [DID] instance to a JSON object.
  @override
  Map<String, dynamic> toJson() {
    return {
      'Account': account,
      'DIDDocument': didDocument,
      'Data': data,
      'LedgerEntryType': ledgerEntryType,
      'OwnerNode': ownerNode,
      'PreviousTxnID': previousTxnID,
      'PreviousTxnLgrSeq': previousTxnLgrSeq,
      'URI': uri,
    };
  }
}

/// Class representing a DirectoryNode in the XRP Ledger.
class DirectoryNode extends LedgerEntry {
  /// The list of IDs of other objects contained in this directory.
  final List<String> indexes;

  /// The type of ledger entry, which is always 'DirectoryNode' for this class.
  final String ledgerEntryType;

  /// The ID of the root object for this directory.
  final String rootIndex;

  /// The identifying hash of the transaction that most recently modified this object.
  final String previousTxnID;

  /// The index of the ledger that contains the transaction that most recently modified this object.
  final int previousTxnLgrSeq;

  /// A bit-map of boolean flags enabled for this object. Currently always 0 for DirectoryNode.
  final int flags;

  /// The currency code of the TakerGets amount from the offers in this directory. (Offer Directory only)
  final String? takerGetsCurrency;

  /// The issuer of the TakerGets amount from the offers in this directory. (Offer Directory only)
  final String? takerGetsIssuer;

  /// The currency code of the TakerPays amount from the offers in this directory. (Offer Directory only)
  final String? takerPaysCurrency;

  /// The issuer of the TakerPays amount from the offers in this directory. (Offer Directory only)
  final String? takerPaysIssuer;

  /// The ID of the NFT in a buy or sell offer. (NFT Offer Directory only)
  final String? nftTokenId;

  /// The address of the account that owns the objects in this directory. (Owner Directory only)
  final String? owner;

  /// Constructs a [DirectoryNode] instance with the given fields.
  DirectoryNode({
    required this.indexes,
    required this.ledgerEntryType,
    required this.rootIndex,
    required this.previousTxnID,
    required this.previousTxnLgrSeq,
    required this.flags,
    this.takerGetsCurrency,
    this.takerGetsIssuer,
    this.takerPaysCurrency,
    this.takerPaysIssuer,
    this.nftTokenId,
    this.owner,
  });

  /// Factory method to create a [DirectoryNode] instance from a JSON object.
  factory DirectoryNode.fromJson(Map<String, dynamic> json) {
    return DirectoryNode(
      indexes: (json['Indexes'] as List).cast<String>(),
      ledgerEntryType: json['LedgerEntryType'],
      rootIndex: json['RootIndex'],
      previousTxnID: json['PreviousTxnID'],
      previousTxnLgrSeq: json['PreviousTxnLgrSeq'],
      flags: json['Flags'] ?? 0,
      takerGetsCurrency: json['TakerGetsCurrency'],
      takerGetsIssuer: json['TakerGetsIssuer'],
      takerPaysCurrency: json['TakerPaysCurrency'],
      takerPaysIssuer: json['TakerPaysIssuer'],
      nftTokenId: json['NFTokenID'],
      owner: json['Owner'],
    );
  }

  /// Method to convert a [DirectoryNode] instance to a JSON object.
  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'Indexes': indexes,
      'LedgerEntryType': ledgerEntryType,
      'RootIndex': rootIndex,
      'PreviousTxnID': previousTxnID,
      'PreviousTxnLgrSeq': previousTxnLgrSeq,
      'Flags': flags,
    };
    if (takerGetsCurrency != null) json['TakerGetsCurrency'] = takerGetsCurrency;
    if (takerGetsIssuer != null) json['TakerGetsIssuer'] = takerGetsIssuer;
    if (takerPaysCurrency != null) json['TakerPaysCurrency'] = takerPaysCurrency;
    if (takerPaysIssuer != null) json['TakerPaysIssuer'] = takerPaysIssuer;
    if (nftTokenId != null) json['NFTokenID'] = nftTokenId;
    if (owner != null) json['Owner'] = owner;
    return json;
  }
}

/// Class representing an Escrow in the XRP Ledger.
class Escrow extends LedgerEntry {
  /// The address of the owner (sender) of this escrow.
  final String account;

  /// The amount of XRP, in drops, currently held in the escrow.
  final String amount;

  /// The destination address where the XRP is paid if the escrow is successful.
  final String destination;

  /// The hint indicating which page of the sender's owner directory links to this entry.
  final String ownerNode;

  /// The identifying hash of the transaction that most recently modified this entry.
  final String previousTxnID;

  /// The index of the ledger that contains the transaction that most recently modified this entry.
  final int previousTxnLgrSeq;

  /// The type of ledger entry, which is always 'Escrow' for this class.
  final String ledgerEntryType;

  /// The time after which this escrow can be canceled.
  final int? cancelAfter;

  /// The crypto-condition that must be fulfilled for the escrow to be successful.
  final String? condition;

  /// The hint indicating which page of the destination's owner directory links to this entry.
  final String? destinationNode;

  /// An arbitrary tag to further specify the destination for this escrow.
  final int? destinationTag;

  /// The time after which this escrow can be finished.
  final int? finishAfter;

  /// An arbitrary tag to further specify the source for this escrow.
  final int? sourceTag;

  /// Constructs an [Escrow] instance with the given fields.
  Escrow({
    required this.account,
    required this.amount,
    required this.destination,
    required this.ownerNode,
    required this.previousTxnID,
    required this.previousTxnLgrSeq,
    required this.ledgerEntryType,
    this.cancelAfter,
    this.condition,
    this.destinationNode,
    this.destinationTag,
    this.finishAfter,
    this.sourceTag,
  });

  /// Factory method to create an [Escrow] instance from a JSON object.
  factory Escrow.fromJson(Map<String, dynamic> json) {
    return Escrow(
      account: json['Account'],
      amount: json['Amount'],
      destination: json['Destination'],
      ownerNode: json['OwnerNode'],
      previousTxnID: json['PreviousTxnID'],
      previousTxnLgrSeq: json['PreviousTxnLgrSeq'],
      ledgerEntryType: json['LedgerEntryType'],
      cancelAfter: json['CancelAfter'],
      condition: json['Condition'],
      destinationNode: json['DestinationNode'],
      destinationTag: json['DestinationTag'],
      finishAfter: json['FinishAfter'],
      sourceTag: json['SourceTag'],
    );
  }

  /// Method to convert an [Escrow] instance to a JSON object.
  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'Account': account,
      'Amount': amount,
      'Destination': destination,
      'OwnerNode': ownerNode,
      'PreviousTxnID': previousTxnID,
      'PreviousTxnLgrSeq': previousTxnLgrSeq,
      'LedgerEntryType': ledgerEntryType,
    };
    if (cancelAfter != null) json['CancelAfter'] = cancelAfter;
    if (condition != null) json['Condition'] = condition;
    if (destinationNode != null) json['DestinationNode'] = destinationNode;
    if (destinationTag != null) json['DestinationTag'] = destinationTag;
    if (finishAfter != null) json['FinishAfter'] = finishAfter;
    if (sourceTag != null) json['SourceTag'] = sourceTag;
    return json;
  }
}

/// Class representing FeeSettings in the XRP Ledger.
class FeeSettings extends LedgerEntry {
  /// The transaction cost of the "reference transaction" in drops of XRP.
  final String baseFee;

  /// A bit-map of boolean flags enabled for this object.
  final int flags;

  /// The type of ledger entry, always 'FeeSettings'.
  final String ledgerEntryType;

  /// The BaseFee translated into "fee units".
  final int referenceFeeUnits;

  /// The base reserve for an account in the XRP Ledger, as drops of XRP.
  final int reserveBase;

  /// The incremental owner reserve for owning objects, as drops of XRP.
  final int reserveIncrement;

  /// Constructs a FeeSettings instance with the given fields.
  FeeSettings({
    required this.baseFee,
    required this.flags,
    required this.ledgerEntryType,
    required this.referenceFeeUnits,
    required this.reserveBase,
    required this.reserveIncrement,
  });

  /// Factory method to create a FeeSettings instance from a JSON object.
  factory FeeSettings.fromJson(Map<String, dynamic> json) {
    return FeeSettings(
      baseFee: json['BaseFee'],
      flags: json['Flags'],
      ledgerEntryType: json['LedgerEntryType'],
      referenceFeeUnits: json['ReferenceFeeUnits'],
      reserveBase: json['ReserveBase'],
      reserveIncrement: json['ReserveIncrement'],
    );
  }

  /// Method to convert a FeeSettings instance to a JSON object.
  @override
  Map<String, dynamic> toJson() {
    return {
      'BaseFee': baseFee,
      'Flags': flags,
      'LedgerEntryType': ledgerEntryType,
      'ReferenceFeeUnits': referenceFeeUnits,
      'ReserveBase': reserveBase,
      'ReserveIncrement': reserveIncrement,
    };
  }
}

/// Class representing LedgerHashes in the XRP Ledger.
class LedgerHashes extends LedgerEntry {
  /// The type of ledger entry, always 'LedgerHashes'.
  final String ledgerEntryType;

  /// An array of up to 256 ledger hashes.
  final List<String> hashes;

  /// The Ledger Index of the last entry in this object's Hashes array.
  final int? lastLedgerSequence;

  /// The index of this LedgerHashes object (applicable for previous history).
  final String? index;

  /// The Ledger Index of the first ledger sequence (deprecated, not used).
  final int? firstLedgerSequence;

  /// A flag indicating whether this object is for recent or previous history.
  final bool isRecentHistory;

  /// Constructs a LedgerHashes instance with the given fields.
  LedgerHashes({
    required this.ledgerEntryType,
    required this.hashes,
    this.lastLedgerSequence,
    this.index,
    this.firstLedgerSequence,
    required this.isRecentHistory,
  });

  /// Factory method to create a LedgerHashes instance from a JSON object.
  factory LedgerHashes.fromJson(Map<String, dynamic> json) {
    return LedgerHashes(
      ledgerEntryType: json['LedgerEntryType'],
      hashes: List<String>.from(json['Hashes']),
      lastLedgerSequence: json['LastLedgerSequence'],
      index: json['index'],
      firstLedgerSequence: json['FirstLedgerSequence'],
      isRecentHistory: json['index'] == null, // Check if it's recent history
    );
  }

  /// Method to convert a LedgerHashes instance to a JSON object.
  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'LedgerEntryType': ledgerEntryType,
      'Hashes': hashes,
    };
    if (lastLedgerSequence != null) {
      json['LastLedgerSequence'] = lastLedgerSequence;
    }
    if (index != null) {
      json['index'] = index;
    }
    if (firstLedgerSequence != null) {
      json['FirstLedgerSequence'] = firstLedgerSequence;
    }
    return json;
  }
}

/// Class representing a disabled validator in the NegativeUNL entry.
class DisabledValidator {
  /// The ledger index when the validator was added to the Negative UNL.
  final int firstLedgerSequence;

  /// The master public key of the validator, in hexadecimal.
  final String publicKey;

  /// Constructs a DisabledValidator instance with the given fields.
  DisabledValidator({
    required this.firstLedgerSequence,
    required this.publicKey,
  });

  /// Factory method to create a DisabledValidator instance from a JSON object.
  factory DisabledValidator.fromJson(Map<String, dynamic> json) {
    return DisabledValidator(
      firstLedgerSequence: json['DisabledValidator']['FirstLedgerSequence'],
      publicKey: json['DisabledValidator']['PublicKey'],
    );
  }

  /// Method to convert a DisabledValidator instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'DisabledValidator': {
        'FirstLedgerSequence': firstLedgerSequence,
        'PublicKey': publicKey,
      }
    };
  }
}

/// Class representing the NegativeUNL ledger entry in the XRP Ledger.
class NegativeUNL extends LedgerEntry {
  /// A list of disabled validators in the Negative UNL.
  final List<DisabledValidator>? disabledValidators;

  /// The public key of a validator scheduled to be disabled.
  final String? validatorToDisable;

  /// The public key of a validator scheduled to be re-enabled.
  final String? validatorToReEnable;

  /// The type of ledger entry, always 'NegativeUNL'.
  final String ledgerEntryType;

  /// The index of the NegativeUNL entry.
  final String index;

  /// Constructs a NegativeUNL instance with the given fields.
  NegativeUNL({
    this.disabledValidators,
    this.validatorToDisable,
    this.validatorToReEnable,
    required this.ledgerEntryType,
    required this.index,
  });

  /// Factory method to create a NegativeUNL instance from a JSON object.
  factory NegativeUNL.fromJson(Map<String, dynamic> json) {
    List<DisabledValidator>? disabledValidators;
    if (json['DisabledValidators'] != null) {
      disabledValidators = List<DisabledValidator>.from(
          json['DisabledValidators'].map((validator) => DisabledValidator.fromJson(validator)));
    }

    return NegativeUNL(
      disabledValidators: disabledValidators,
      validatorToDisable: json['ValidatorToDisable'],
      validatorToReEnable: json['ValidatorToReEnable'],
      ledgerEntryType: json['LedgerEntryType'],
      index: json['index'],
    );
  }

  /// Method to convert a NegativeUNL instance to a JSON object.
  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'LedgerEntryType': ledgerEntryType,
      'index': index,
    };

    if (disabledValidators != null) {
      json['DisabledValidators'] = disabledValidators!.map((validator) => validator.toJson()).toList();
    }
    if (validatorToDisable != null) {
      json['ValidatorToDisable'] = validatorToDisable;
    }
    if (validatorToReEnable != null) {
      json['ValidatorToReEnable'] = validatorToReEnable;
    }

    return json;
  }
}

/// Class representing an offer to buy, sell, or transfer an NFT (Non-Fungible Token).
class NFTokenOffer extends LedgerEntry {
  /// The amount of XRP or other currency offered or expected for the NFToken.
  final String amount;

  /// The AccountID for which this offer is intended.
  final String? destination;

  /// The time after which the offer is no longer active, in seconds since the Ripple Epoch.
  final int? expiration;

  /// The type of ledger entry, always 'NFTokenOffer'.
  final String ledgerEntryType;

  /// The NFTokenID of the NFToken object referenced by this offer.
  final String nfTokenID;

  /// Internal bookkeeping for the page inside the token buy or sell offer directory.
  final String? nfTokenOfferNode;

  /// The owner of the account that is creating and owns the offer.
  final String owner;

  /// Internal bookkeeping for the page inside the owner directory where this token is being tracked.
  final String? ownerNode;

  /// The identifying hash of the transaction that most recently modified this object.
  final String previousTxnID;

  /// The index of the ledger that contains the transaction that most recently modified this object.
  final int previousTxnLgrSeq;

  /// The flags associated with the NFTokenOffer entry.
  final int flags;

  /// Constructs an NFTokenOffer instance with the given fields.
  NFTokenOffer({
    required this.amount,
    this.destination,
    this.expiration,
    required this.ledgerEntryType,
    required this.nfTokenID,
    this.nfTokenOfferNode,
    required this.owner,
    this.ownerNode,
    required this.previousTxnID,
    required this.previousTxnLgrSeq,
    required this.flags,
  });

  /// Factory method to create an NFTokenOffer instance from a JSON object.
  factory NFTokenOffer.fromJson(Map<String, dynamic> json) {
    return NFTokenOffer(
      amount: json['Amount'],
      destination: json['Destination'],
      expiration: json['Expiration'],
      ledgerEntryType: json['LedgerEntryType'],
      nfTokenID: json['NFTokenID'],
      nfTokenOfferNode: json['NFTokenOfferNode'],
      owner: json['Owner'],
      ownerNode: json['OwnerNode'],
      previousTxnID: json['PreviousTxnID'],
      previousTxnLgrSeq: json['PreviousTxnLgrSeq'],
      flags: json['Flags'],
    );
  }

  /// Method to convert an NFTokenOffer instance to a JSON object.
  @override
  Map<String, dynamic> toJson() {
    return {
      'Amount': amount,
      'Destination': destination,
      'Expiration': expiration,
      'LedgerEntryType': ledgerEntryType,
      'NFTokenID': nfTokenID,
      'NFTokenOfferNode': nfTokenOfferNode,
      'Owner': owner,
      'OwnerNode': ownerNode,
      'PreviousTxnID': previousTxnID,
      'PreviousTxnLgrSeq': previousTxnLgrSeq,
      'Flags': flags,
    };
  }
}

/// Class representing an NFTokenPage, which contains a collection of NFToken objects owned by the same account.
class NFTokenPage extends LedgerEntry {
  /// The type of ledger entry, always 'NFTokenPage'.
  final String ledgerEntryType;

  /// The locator of the previous page, if any.
  final String? previousPageMin;

  /// The locator of the next page, if any.
  final String? nextPageMin;

  /// Identifies the transaction ID of the transaction that most recently modified this NFTokenPage object.
  final String? previousTxnID;

  /// The sequence of the ledger that contains the transaction that most recently modified this NFTokenPage object.
  final int? previousTxnLgrSeq;

  /// The collection of NFToken objects contained in this NFTokenPage object.
  final List<NFToken> nftokens;

  /// Constructs an NFTokenPage instance with the given fields.
  NFTokenPage({
    required this.ledgerEntryType,
    this.previousPageMin,
    this.nextPageMin,
    this.previousTxnID,
    this.previousTxnLgrSeq,
    required this.nftokens,
  });

  /// Factory method to create an NFTokenPage instance from a JSON object.
  factory NFTokenPage.fromJson(Map<String, dynamic> json) {
    List<dynamic> nftokenList = json['NFTokens'];
    List<NFToken> nftokens = nftokenList.map((nftJson) => NFToken.fromJson(nftJson['NFToken'])).toList();

    return NFTokenPage(
      ledgerEntryType: json['LedgerEntryType'],
      previousPageMin: json['PreviousPageMin'],
      nextPageMin: json['NextPageMin'],
      previousTxnID: json['PreviousTxnID'],
      previousTxnLgrSeq: json['PreviousTxnLgrSeq'],
      nftokens: nftokens,
    );
  }

  /// Method to convert an NFTokenPage instance to a JSON object.
  @override
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> nftokenJsonList = nftokens.map((nft) => {'NFToken': nft.toJson()}).toList();

    return {
      'LedgerEntryType': ledgerEntryType,
      'PreviousPageMin': previousPageMin,
      'NextPageMin': nextPageMin,
      'PreviousTxnID': previousTxnID,
      'PreviousTxnLgrSeq': previousTxnLgrSeq,
      'NFTokens': nftokenJsonList,
    };
  }
}

/// Class representing an NFToken object.
class NFToken {
  /// The NFTokenID of the NFToken object.
  final String nfTokenID;

  /// The URI associated with the NFToken.
  final String uri;

  /// Constructs an NFToken instance with the given fields.
  NFToken({
    required this.nfTokenID,
    required this.uri,
  });

  /// Factory method to create an NFToken instance from a JSON object.
  factory NFToken.fromJson(Map<String, dynamic> json) {
    return NFToken(
      nfTokenID: json['NFTokenID'],
      uri: json['URI'],
    );
  }

  /// Method to convert an NFToken instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'NFTokenID': nfTokenID,
      'URI': uri,
    };
  }
}

/// Represents an Offer entry in the XRP Ledger.
class Offer extends LedgerEntry {
  /// The address of the account that owns this Offer.
  final String account;

  /// The ID of the Offer Directory that links to this Offer.
  final String bookDirectory;

  /// A hint indicating which page of the offer directory links to this entry.
  final String bookNode;

  /// Flags that control the behavior of this Offer.
  final int flags;

  /// The type of LedgerEntry, always 'Offer' (0x006F).
  final String ledgerEntryType;

  /// A hint indicating which page of the owner directory links to this entry.
  final String ownerNode;

  /// The identifying hash of the transaction that most recently modified this entry.
  final String previousTxnID;

  /// The index of the ledger that contains the transaction that most recently modified this object.
  final int previousTxnLgrSeq;

  /// The Sequence value of the OfferCreate transaction that created this offer.
  final int sequence;

  /// The remaining amount and type of currency requested by the Offer creator.
  final CurrencyAmount takerPays;

  /// The remaining amount and type of currency being provided by the Offer creator.
  final CurrencyAmount takerGets;

  /// Optional: Used for indexing in ledger, not necessary for ID calculation.
  final String index;

  /// Constructs an Offer object.
  const Offer({
    required this.account,
    required this.bookDirectory,
    required this.bookNode,
    required this.flags,
    required this.ledgerEntryType,
    required this.ownerNode,
    required this.previousTxnID,
    required this.previousTxnLgrSeq,
    required this.sequence,
    required this.takerPays,
    required this.takerGets,
    required this.index,
  });

  /// Constructs an Offer object from a JSON map.
  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      account: json['Account'],
      bookDirectory: json['BookDirectory'],
      bookNode: json['BookNode'],
      flags: json['Flags'],
      ledgerEntryType: json['LedgerEntryType'],
      ownerNode: json['OwnerNode'],
      previousTxnID: json['PreviousTxnID'],
      previousTxnLgrSeq: json['PreviousTxnLgrSeq'],
      sequence: json['Sequence'],
      takerPays: CurrencyAmount.fromJson(json['TakerPays']),
      takerGets: CurrencyAmount.fromJson(json['TakerGets']),
      index: json['index'],
    );
  }

  /// Converts the Offer object to a JSON map.
  @override
  Map<String, dynamic> toJson() {
    return {
      'Account': account,
      'BookDirectory': bookDirectory,
      'BookNode': bookNode,
      'Flags': flags,
      'LedgerEntryType': ledgerEntryType,
      'OwnerNode': ownerNode,
      'PreviousTxnID': previousTxnID,
      'PreviousTxnLgrSeq': previousTxnLgrSeq,
      'Sequence': sequence,
      'TakerPays': takerPays.toJson(),
      'TakerGets': takerGets.toJson(),
      'index': index,
    };
  }
}

/// Represents a PayChannel entry in the XRP Ledger.
class PayChannel extends LedgerEntry {
  /// The source address that owns this payment channel.
  final String account;

  /// The destination address for this payment channel.
  final String destination;

  /// Total XRP, in drops, that has been allocated to this channel.
  final String amount;

  /// Total XRP, in drops, already paid out by the channel.
  final String balance;

  /// Public key, in hexadecimal, of the key pair that can be used to sign claims against this channel.
  final String publicKey;

  /// Number of seconds the source address must wait to close the channel if it still has any XRP in it.
  final int settleDelay;

  /// Optional: The mutable expiration time for this payment channel.
  final int? expiration;

  /// Optional: The immutable expiration time for this payment channel.
  final int? cancelAfter;

  /// An arbitrary tag to further specify the source for this payment channel.
  final int? sourceTag;

  /// An arbitrary tag to further specify the destination for this payment channel.
  final int? destinationTag;

  /// A hint indicating which page of the source address's owner directory links to this entry.
  final String ownerNode;

  /// A hint indicating which page of the destination's owner directory links to this entry.
  final String? destinationNode;

  /// Flags that control the behavior of this PayChannel.
  final int flags;

  /// The type of LedgerEntry, always 'PayChannel' (0x0078).
  final String ledgerEntryType;

  /// The identifying hash of the transaction that most recently modified this entry.
  final String previousTxnID;

  /// The index of the ledger that contains the transaction that most recently modified this entry.
  final int previousTxnLgrSeq;

  /// Optional: Used for indexing in ledger, not necessary for ID calculation.
  final String index;

  /// Constructs a PayChannel object.
  const PayChannel({
    required this.account,
    required this.destination,
    required this.amount,
    required this.balance,
    required this.publicKey,
    required this.settleDelay,
    this.expiration,
    this.cancelAfter,
    this.sourceTag,
    this.destinationTag,
    required this.ownerNode,
    this.destinationNode,
    required this.flags,
    required this.ledgerEntryType,
    required this.previousTxnID,
    required this.previousTxnLgrSeq,
    required this.index,
  });

  /// Constructs a PayChannel object from a JSON map.
  factory PayChannel.fromJson(Map<String, dynamic> json) {
    return PayChannel(
      account: json['Account'],
      destination: json['Destination'],
      amount: json['Amount'],
      balance: json['Balance'],
      publicKey: json['PublicKey'],
      settleDelay: json['SettleDelay'],
      expiration: json['Expiration'],
      cancelAfter: json['CancelAfter'],
      sourceTag: json['SourceTag'],
      destinationTag: json['DestinationTag'],
      ownerNode: json['OwnerNode'],
      destinationNode: json['DestinationNode'],
      flags: json['Flags'],
      ledgerEntryType: json['LedgerEntryType'],
      previousTxnID: json['PreviousTxnID'],
      previousTxnLgrSeq: json['PreviousTxnLgrSeq'],
      index: json['index'],
    );
  }

  /// Converts the PayChannel object to a JSON map.
  @override
  Map<String, dynamic> toJson() {
    return {
      'Account': account,
      'Destination': destination,
      'Amount': amount,
      'Balance': balance,
      'PublicKey': publicKey,
      'SettleDelay': settleDelay,
      'Expiration': expiration,
      'CancelAfter': cancelAfter,
      'SourceTag': sourceTag,
      'DestinationTag': destinationTag,
      'OwnerNode': ownerNode,
      'DestinationNode': destinationNode,
      'Flags': flags,
      'LedgerEntryType': ledgerEntryType,
      'PreviousTxnID': previousTxnID,
      'PreviousTxnLgrSeq': previousTxnLgrSeq,
      'index': index,
    };
  }
}

class SignerList extends LedgerEntry {
  final int flags;
  final String ledgerEntryType;
  final String ownerNode;
  final String previousTxnID;
  final int previousTxnLgrSeq;
  final List<SignerEntry> signerEntries;
  final int signerListID;
  final int signerQuorum;
  final String index;

  const SignerList({
    required this.flags,
    required this.ledgerEntryType,
    required this.ownerNode,
    required this.previousTxnID,
    required this.previousTxnLgrSeq,
    required this.signerEntries,
    required this.signerListID,
    required this.signerQuorum,
    required this.index,
  });

  factory SignerList.fromJson(Map<String, dynamic> json) {
    var signerEntriesJson = json['SignerEntries'] as List;
    List<SignerEntry> signerEntriesList = signerEntriesJson.map((i) => SignerEntry.fromJson(i['SignerEntry'])).toList();

    return SignerList(
      flags: json['Flags'],
      ledgerEntryType: json['LedgerEntryType'],
      ownerNode: json['OwnerNode'],
      previousTxnID: json['PreviousTxnID'],
      previousTxnLgrSeq: json['PreviousTxnLgrSeq'],
      signerEntries: signerEntriesList,
      signerListID: json['SignerListID'],
      signerQuorum: json['SignerQuorum'],
      index: json['index'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'Flags': flags,
      'LedgerEntryType': ledgerEntryType,
      'OwnerNode': ownerNode,
      'PreviousTxnID': previousTxnID,
      'PreviousTxnLgrSeq': previousTxnLgrSeq,
      'SignerEntries': signerEntries.map((e) => {'SignerEntry': e.toJson()}).toList(),
      'SignerListID': signerListID,
      'SignerQuorum': signerQuorum,
      'index': index,
    };
  }
}

class SignerEntry {
  final String account;
  final int signerWeight;

  SignerEntry({
    required this.account,
    required this.signerWeight,
  });

  factory SignerEntry.fromJson(Map<String, dynamic> json) {
    return SignerEntry(
      account: json['Account'],
      signerWeight: json['SignerWeight'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Account': account,
      'SignerWeight': signerWeight,
    };
  }
}

/// Represents a RippleState ledger entry in the XRP Ledger.
class RippleState extends LedgerEntry {
  /// The balance of the trust line, from the perspective of the low account.
  final CurrencyAmount balance;

  /// A bit-map of boolean options enabled for this entry.
  final int flags;

  /// The limit that the high account has set on the trust line.
  final CurrencyAmount highLimit;

  /// A hint indicating which page of the high account's owner directory links to this entry.
  final String highNode;

  /// The limit that the low account has set on the trust line.
  final CurrencyAmount lowLimit;

  /// A hint indicating which page of the low account's owner directory links to this entry.
  final String lowNode;

  /// The identifying hash of the transaction that most recently modified this entry.
  final String previousTxnID;

  /// The index of the ledger that contains the transaction that most recently modified this entry.
  final int previousTxnLgrSeq;

  /// Used for indexing in ledger, not necessary for ID calculation.
  final String index;

  /// Constructs a RippleState object.
  const RippleState({
    required this.balance,
    required this.flags,
    required this.highLimit,
    required this.highNode,
    required this.lowLimit,
    required this.lowNode,
    required this.previousTxnID,
    required this.previousTxnLgrSeq,
    required this.index,
  });

  /// Constructs a RippleState object from a JSON map.
  factory RippleState.fromJson(Map<String, dynamic> json) {
    return RippleState(
      balance: CurrencyAmount.fromJson(json['Balance']),
      flags: json['Flags'],
      highLimit: CurrencyAmount.fromJson(json['HighLimit']),
      highNode: json['HighNode'],
      lowLimit: CurrencyAmount.fromJson(json['LowLimit']),
      lowNode: json['LowNode'],
      previousTxnID: json['PreviousTxnID'],
      previousTxnLgrSeq: json['PreviousTxnLgrSeq'],
      index: json['index'],
    );
  }

  /// Converts the RippleState object to a JSON map.
  @override
  Map<String, dynamic> toJson() {
    return {
      'Balance': balance.toJson(),
      'Flags': flags,
      'HighLimit': highLimit.toJson(),
      'HighNode': highNode,
      'LowLimit': lowLimit.toJson(),
      'LowNode': lowNode,
      'PreviousTxnID': previousTxnID,
      'PreviousTxnLgrSeq': previousTxnLgrSeq,
      'index': index,
    };
  }
}

/// Represents a Ticket entry in the XRP Ledger.
class Ticket extends LedgerEntry {
  /// The account that owns this Ticket.
  final String account;

  /// A hint indicating which page of the owner directory links to this entry.
  final String ownerNode;

  /// The identifying hash of the transaction that most recently modified this entry.
  final String previousTxnID;

  /// The index of the ledger that contains the transaction that most recently modified this entry.
  final int previousTxnLgrSeq;

  /// The Sequence Number this Ticket sets aside.
  final int ticketSequence;

  /// Constructs a Ticket object.
  const Ticket({
    required this.account,
    required this.ownerNode,
    required this.previousTxnID,
    required this.previousTxnLgrSeq,
    required this.ticketSequence,
  });

  /// Constructs a Ticket object from a JSON map.
  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      account: json['Account'],
      ownerNode: json['OwnerNode'],
      previousTxnID: json['PreviousTxnID'],
      previousTxnLgrSeq: json['PreviousTxnLgrSeq'],
      ticketSequence: json['TicketSequence'],
    );
  }

  /// Converts the Ticket object to a JSON map.
  @override
  Map<String, dynamic> toJson() {
    return {
      'Account': account,
      'OwnerNode': ownerNode,
      'PreviousTxnID': previousTxnID,
      'PreviousTxnLgrSeq': previousTxnLgrSeq,
      'TicketSequence': ticketSequence,
    };
  }
}

/// Represents an XChainOwnedClaimID object in the XRP Ledger.
class XChainOwnedClaimID extends LedgerEntry {
  /// The account that owns this object.
  final String account;

  /// The ledger index, which is a hash of a unique prefix for XChainOwnedClaimIDs.
  final String ledgerIndex;

  /// The account that must send the corresponding XChainCommit on the source chain.
  final String otherChainSource;

  /// The total amount to pay the witness servers for their signatures.
  final String signatureReward;

  /// The bridge details for this object.
  final XChainBridge xChainBridge;

  /// Attestations collected from the witness servers.
  final List<XChainClaimAttestation> xChainClaimAttestations;

  /// The unique sequence number for a cross-chain transfer.
  final String xChainClaimID;

  /// The identifying hash of the transaction that most recently modified this entry.
  final String previousTxnID;

  /// The index of the ledger that contains the transaction that most recently modified this entry.
  final int previousTxnLgrSeq;

  /// A hint indicating which page of the owner directory links to this entry.
  final String ownerNode;

  /// Constructs an XChainOwnedClaimID object.
  const XChainOwnedClaimID({
    required this.account,
    required this.ledgerIndex,
    required this.otherChainSource,
    required this.signatureReward,
    required this.xChainBridge,
    required this.xChainClaimAttestations,
    required this.xChainClaimID,
    required this.previousTxnID,
    required this.previousTxnLgrSeq,
    required this.ownerNode,
  });

  /// Constructs an XChainOwnedClaimID object from a JSON map.
  factory XChainOwnedClaimID.fromJson(Map<String, dynamic> json) {
    List<XChainClaimAttestation> attestations = [];
    if (json['XChainClaimAttestations'] != null) {
      for (var attestation in json['XChainClaimAttestations']) {
        attestations.add(XChainClaimAttestation.fromJson(attestation));
      }
    }

    return XChainOwnedClaimID(
      account: json['Account'],
      ledgerIndex: json['LedgerIndex'],
      otherChainSource: json['OtherChainSource'],
      signatureReward: json['SignatureReward'],
      xChainBridge: XChainBridge.fromJson(json['XChainBridge']),
      xChainClaimAttestations: attestations,
      xChainClaimID: json['XChainClaimID'],
      previousTxnID: json['PreviousTxnID'],
      previousTxnLgrSeq: json['PreviousTxnLgrSeq'],
      ownerNode: json['OwnerNode'],
    );
  }

  /// Converts the XChainOwnedClaimID object to a JSON map.
  @override
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> attestationsJson =
        xChainClaimAttestations.map((attestation) => attestation.toJson()).toList();

    return {
      'Account': account,
      'LedgerIndex': ledgerIndex,
      'OtherChainSource': otherChainSource,
      'SignatureReward': signatureReward,
      'XChainBridge': xChainBridge.toJson(),
      'XChainClaimAttestations': attestationsJson,
      'XChainClaimID': xChainClaimID,
      'PreviousTxnID': previousTxnID,
      'PreviousTxnLgrSeq': previousTxnLgrSeq,
      'OwnerNode': ownerNode,
    };
  }
}

/// Represents an attestation from a witness server.
class XChainClaimAttestation {
  final XChainClaimProofSig xChainClaimProofSig;

  const XChainClaimAttestation({
    required this.xChainClaimProofSig,
  });

  factory XChainClaimAttestation.fromJson(Map<String, dynamic> json) {
    return XChainClaimAttestation(
      xChainClaimProofSig: XChainClaimProofSig.fromJson(json['XChainClaimProofSig']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'XChainClaimProofSig': xChainClaimProofSig.toJson(),
    };
  }
}

/// Represents proof of signature for a claim attestation.
class XChainClaimProofSig {
  final String amount;
  final String attestationRewardAccount;
  final String attestationSignerAccount;
  final String destination;
  final String publicKey;
  final int wasLockingChainSend;

  const XChainClaimProofSig({
    required this.amount,
    required this.attestationRewardAccount,
    required this.attestationSignerAccount,
    required this.destination,
    required this.publicKey,
    required this.wasLockingChainSend,
  });

  factory XChainClaimProofSig.fromJson(Map<String, dynamic> json) {
    return XChainClaimProofSig(
      amount: json['Amount'],
      attestationRewardAccount: json['AttestationRewardAccount'],
      attestationSignerAccount: json['AttestationSignerAccount'],
      destination: json['Destination'],
      publicKey: json['PublicKey'],
      wasLockingChainSend: json['WasLockingChainSend'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Amount': amount,
      'AttestationRewardAccount': attestationRewardAccount,
      'AttestationSignerAccount': attestationSignerAccount,
      'Destination': destination,
      'PublicKey': publicKey,
      'WasLockingChainSend': wasLockingChainSend,
    };
  }
}

/// Represents an XChainOwnedCreateAccountClaimID object in the XRP Ledger.
class XChainOwnedCreateAccountClaimID extends LedgerEntry {
  /// The account that owns this object.
  final String account;

  /// The ledger index, which is a hash of a unique prefix for XChainOwnedCreateAccountClaimIDs.
  final String ledgerIndex;

  /// An integer that determines the order that accounts created through cross-chain transfers must be performed.
  final String xChainAccountCreateCount;

  /// The bridge details for this object.
  final XChainBridge xChainBridge;

  /// Attestations collected from the witness servers.
  final List<XChainCreateAccountAttestation> xChainCreateAccountAttestations;

  /// Constructs an XChainOwnedCreateAccountClaimID object.
  const XChainOwnedCreateAccountClaimID({
    required this.account,
    required this.ledgerIndex,
    required this.xChainAccountCreateCount,
    required this.xChainBridge,
    required this.xChainCreateAccountAttestations,
  });

  /// Constructs an XChainOwnedCreateAccountClaimID object from a JSON map.
  factory XChainOwnedCreateAccountClaimID.fromJson(Map<String, dynamic> json) {
    List<XChainCreateAccountAttestation> attestations = [];
    if (json['XChainCreateAccountAttestations'] != null) {
      for (var attestation in json['XChainCreateAccountAttestations']) {
        attestations.add(XChainCreateAccountAttestation.fromJson(attestation));
      }
    }

    return XChainOwnedCreateAccountClaimID(
      account: json['Account'],
      ledgerIndex: json['LedgerIndex'],
      xChainAccountCreateCount: json['XChainAccountCreateCount'],
      xChainBridge: XChainBridge.fromJson(json['XChainBridge']),
      xChainCreateAccountAttestations: attestations,
    );
  }

  /// Converts the XChainOwnedCreateAccountClaimID object to a JSON map.
  @override
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> attestationsJson =
        xChainCreateAccountAttestations.map((attestation) => attestation.toJson()).toList();

    return {
      'Account': account,
      'LedgerIndex': ledgerIndex,
      'XChainAccountCreateCount': xChainAccountCreateCount,
      'XChainBridge': xChainBridge.toJson(),
      'XChainCreateAccountAttestations': attestationsJson,
    };
  }
}

/// Represents an attestation from a witness server for account creation.
class XChainCreateAccountAttestation {
  final XChainCreateAccountProofSig xChainCreateAccountProofSig;

  const XChainCreateAccountAttestation({
    required this.xChainCreateAccountProofSig,
  });

  factory XChainCreateAccountAttestation.fromJson(Map<String, dynamic> json) {
    return XChainCreateAccountAttestation(
      xChainCreateAccountProofSig: XChainCreateAccountProofSig.fromJson(json['XChainCreateAccountProofSig']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'XChainCreateAccountProofSig': xChainCreateAccountProofSig.toJson(),
    };
  }
}

/// Represents proof of signature for an account creation attestation.
class XChainCreateAccountProofSig {
  final String amount;
  final String attestationRewardAccount;
  final String attestationSignerAccount;
  final String destination;
  final String publicKey;
  final int wasLockingChainSend;

  const XChainCreateAccountProofSig({
    required this.amount,
    required this.attestationRewardAccount,
    required this.attestationSignerAccount,
    required this.destination,
    required this.publicKey,
    required this.wasLockingChainSend,
  });

  factory XChainCreateAccountProofSig.fromJson(Map<String, dynamic> json) {
    return XChainCreateAccountProofSig(
      amount: json['Amount'],
      attestationRewardAccount: json['AttestationRewardAccount'],
      attestationSignerAccount: json['AttestationSignerAccount'],
      destination: json['Destination'],
      publicKey: json['PublicKey'],
      wasLockingChainSend: json['WasLockingChainSend'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Amount': amount,
      'AttestationRewardAccount': attestationRewardAccount,
      'AttestationSignerAccount': attestationSignerAccount,
      'Destination': destination,
      'PublicKey': publicKey,
      'WasLockingChainSend': wasLockingChainSend,
    };
  }
}
