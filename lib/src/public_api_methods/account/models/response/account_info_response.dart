import 'package:xrpl_flutter_sdk/src/public_api_methods/models/transaction.dart';
import 'package:xrpl_flutter_sdk/xrpl_flutter_sdk.dart';

class AccountInfoResponse implements XrpResponse {
  /// id of the request that prompted this response (only for websocket requests)
  dynamic id;

  AccountInfoResultResponse result;

  AccountInfoResponse({
    required this.result,
    this.id,
  });

  @override
  factory AccountInfoResponse.fromRpcJson(Map<String, dynamic> json) {
    return AccountInfoResponse(
      result: AccountInfoResultResponse.toJson(json),
    );
  }

  @override
  factory AccountInfoResponse.fromWebSocketJson(Map<String, dynamic> json) {
    return AccountInfoResponse(
      result: AccountInfoResultResponse.toJson(json),
      id: json['id'],
    );
  }
}

class AccountInfoResultResponse {
  /// account_data	Object	The AccountRoot ledger object with this account's information, as stored in the ledger.
  final AccountRoot accountData;

  ///	The account's flag statuses (see below), based on the Flags field of the account. New in: rippled 1.11.0
  final AccountFlags accountFlags;

  ///	API v1: (Omitted unless the request specified signer_lists and at least one SignerList is associated with the account.) Array of SignerList ledger objects associated with this account for Multi-Signing. Since an account can own at most one SignerList, this array must have exactly one member if it is present. The field is nested under account_data.
  /// API v2: Identical to API v1, but the field is returned in the root response instead. Clio implements the API v2 behavior in all cases.
  final List<SignerList> signerList;

  /// (Omitted if ledger_index is provided instead) The ledger index of the current in-progress ledger, which was used when retrieving this information.
  final int? ledgerCurrentIndex;

  /// (Omitted if ledger_current_index is provided instead) The ledger index of the ledger version used when retrieving this information. The information does not contain any changes from ledger versions newer than this one.
  final int? ledgerIndex;

  /// (Omitted unless queue specified as true and querying the current open ledger.) Information about queued transactions sent by this account. This information describes the state of the local rippled server, which may be different from other servers in the peer-to-peer XRP Ledger network.
  /// Some fields may be omitted because the values are calculated "lazily" by the queuing mechanism.
  final AccountQueueData? queueData;
//// if this data is from a validated ledger version; if omitted or set to false, this data is not final.
  final bool validated;

  const AccountInfoResultResponse({
    required this.accountData,
    required this.accountFlags,
    required this.signerList,
    this.ledgerCurrentIndex,
    this.ledgerIndex,
    this.queueData,
    required this.validated,
  });

  factory AccountInfoResultResponse.toJson(Map<String, dynamic> json) {
    return AccountInfoResultResponse(
      accountData: AccountRoot.fromJson(json['result']['account_data']),
      accountFlags: AccountFlags.fromJson(json['result']['account_data']['Flags']),
      signerList:
          List<SignerList>.from(json['result']['account_data']['SignerList'].map((x) => SignerList.fromJson(x))),
      ledgerCurrentIndex: json['result']['ledger_current_index'],
      ledgerIndex: json['result']['ledger_index'],
      queueData: AccountQueueData.fromJson(json['result']['queue_data']),
      validated: json['result']['validated'],
    );
  }
}

class AccountRootInfo {
  ///  Account	String	AccountID	The identifying (classic) address of this account.
  final String account;

  /// AccountTxnID	String	Hash256	The identifying hash of the transaction most recently sent by this account. This field must be enabled to use the AccountTxnID transaction field. To enable it, send an AccountSet transaction with the asfAccountTxnID flag enabled.
  final String? accountTxnID;

  /// AMMID	String	Hash256 (Requires the AMM amendment) The ledger entry ID of the corresponding AMM ledger entry. Set during account creation; cannot be modified. If present, indicates that this is a special AMM AccountRoot; always omitted on non-AMM accounts.
  final String? ammID;

  /// Balance	String	Amount The account's current XRP balance in drops, represented as a string.
  final String? balance;

  /// BurnedNFTokens	Number	UInt32 How many total of this account's issued non-fungible tokens have been burned. This number is always equal or less than MintedNFTokens.
  final int? burnedNFTokens;

  /// Domain	String	Blob A domain associated with this account. In JSON, this is the hexadecimal for the ASCII representation of the domain. Cannot be more than 256 bytes in length.
  final String? domain;

  /// EmailHash	String	Hash128 The md5 hash of an email address. Clients can use this to look up an avatar through services such as Gravatar.
  final String? emailHash;

  /// FirstNFTokenSequence	Number	UInt32 The account's Sequence Number at the time it minted its first non-fungible-token. (Added by the fixNFTokenRemint amendment)
  final int? firstNFTokenSequence;

  /// LedgerEntryType	String	UInt16 The value 0x0061, mapped to the string AccountRoot, indicates that this is an AccountRoot object.
  final String ledgerEntryType;

  /// MessageKey	String	Blob A public key that may be used to send encrypted messages to this account. In JSON, uses hexadecimal. Must be exactly 33 bytes, with the first byte indicating the key type: 0x02 or 0x03 for secp256k1 keys, 0xED for Ed25519 keys.
  final String? messageKey;

  /// MintedNFTokens	Number	UInt32 How many total non-fungible tokens have been minted by and on behalf of this account. (Added by the NonFungibleTokensV1_1 amendment)
  final int? mintedNFTokens;

  /// NFTokenMinter	String	AccountID Another account that can mint non-fungible tokens on behalf of this account. (Added by the NonFungibleTokensV1_1 amendment)
  final String? nfTokenMinter;

  /// OwnerCount	Number	UInt32 The number of objects this account owns in the ledger, which contributes to its owner reserve.
  final int ownerCount;

  /// PreviousTxnID	String	Hash256	The identifying hash of the transaction that most recently modified this object.
  final String previousTxnID;

  /// PreviousTxnLgrSeq	Number	UInt32 The index of the ledger that contains the transaction that most recently modified this object.
  final int previousTxnLgrSeq;

  /// RegularKey	String	AccountID The address of a key pair that can be used to sign transactions for this account instead of the master key. Use a SetRegularKey transaction to change this value.
  final String? regularKey;

  /// Sequence	Number	UInt32 The sequence number of the next valid transaction for this account.
  final int sequence;

  /// TicketCount	Number	UInt32 How many Tickets this account owns in the ledger. This is updated automatically to ensure that the account stays within the hard limit of 250 Tickets at a time. This field is omitted if the account has zero Tickets. (Added by the TicketBatch amendment.)
  final int? ticketCount;

  /// TickSize	Number	UInt8 How many significant digits to use for exchange rates of Offers involving currencies issued by this address. Valid values are 3 to 15, inclusive. (Added by the TickSize amendment.)
  final int? tickSize;

  /// TransferRate	Number	UInt32 A transfer fee to charge other users for sending currency issued by this account to each other.
  final int? transferRate;

  /// WalletLocator	String	Hash256 An arbitrary 256-bit value that users can set.
  final String? walletLocator;

  /// WalletSize	Number	UInt32 Unused. (The code supports this field but there is no way to set it.)
  final int? walletSize;

  const AccountRootInfo({
    required this.account,
    this.accountTxnID,
    this.ammID,
    this.balance,
    this.burnedNFTokens,
    this.domain,
    this.emailHash,
    this.firstNFTokenSequence,
    required this.ledgerEntryType,
    this.messageKey,
    this.mintedNFTokens,
    this.nfTokenMinter,
    required this.ownerCount,
    required this.previousTxnID,
    required this.previousTxnLgrSeq,
    this.regularKey,
    required this.sequence,
    this.ticketCount,
    this.tickSize,
    this.transferRate,
    this.walletLocator,
    this.walletSize,
  });

  factory AccountRootInfo.fromJson(Map<String, dynamic> json) {
    return AccountRootInfo(
      account: json['Account'],
      accountTxnID: json['AccountTxnID'],
      ammID: json['AMMID'],
      balance: json['Balance'],
      burnedNFTokens: json['BurnedNFTokens'],
      domain: json['Domain'],
      emailHash: json['EmailHash'],
      firstNFTokenSequence: json['FirstNFTokenSequence'],
      ledgerEntryType: json['LedgerEntryType'],
      messageKey: json['MessageKey'],
      mintedNFTokens: json['MintedNFTokens'],
      nfTokenMinter: json['NFTokenMinter'],
      ownerCount: json['OwnerCount'],
      previousTxnID: json['PreviousTxnID'],
      previousTxnLgrSeq: json['PreviousTxnLgrSeq'],
      regularKey: json['RegularKey'],
      sequence: json['Sequence'],
      ticketCount: json['TicketCount'],
      tickSize: json['TickSize'],
      transferRate: json['TransferRate'],
      walletLocator: json['WalletLocator'],
      walletSize: json['WalletSize'],
    );
  }
}

class AccountFlags {
  /// The account's flag statuses (see below), based on the Flags field of the account. New in: rippled 1.11.0
  final int flags;

  AccountFlags({
    required this.flags,
  });

  factory AccountFlags.fromJson(int json) {
    return AccountFlags(
      flags: json,
    );
  }
}

class AccountQueueData {
  /// The number of queued transactions from this address.
  final int txnCount;

  /// (Optional) Whether a transaction in the queue changes this address's ways of authorizing transactions.
  /// If true, this address can queue no further transactions until that transaction has been executed or dropped from the queue.
  final bool? authChangeQueued;

  /// (Optional) The lowest Sequence Number among transactions queued by this address.
  final int? lowestSequence;

  /// (Optional) The highest Sequence Number among transactions queued by this address.
  final int? highestSequence;

  /// (Optional) Integer amount of drops of XRP that could be debited from this address if every transaction in the queue consumes the maximum amount of XRP possible.
  final String? maxSpendDropsTotal;

  /// (Optional) Information about each queued transaction from this address.
  final List<Transaction>? transactions;

  const AccountQueueData({
    required this.txnCount,
    this.authChangeQueued,
    this.lowestSequence,
    this.highestSequence,
    this.maxSpendDropsTotal,
    this.transactions,
  });

  factory AccountQueueData.fromJson(Map<String, dynamic> json) {
    var transactionsJson = json['transactions'] as List?;
    List<Transaction>? transactionsList = transactionsJson?.map((i) => Transaction.fromJson(i)).toList();

    return AccountQueueData(
      txnCount: json['txn_count'],
      authChangeQueued: json['auth_change_queued'],
      lowestSequence: json['lowest_sequence'],
      highestSequence: json['highest_sequence'],
      maxSpendDropsTotal: json['max_spend_drops_total'],
      transactions: transactionsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'txn_count': txnCount,
      'auth_change_queued': authChangeQueued,
      'lowest_sequence': lowestSequence,
      'highest_sequence': highestSequence,
      'max_spend_drops_total': maxSpendDropsTotal,
      'transactions': transactions?.map((e) => e.toJson()).toList(),
    };
  }
}
