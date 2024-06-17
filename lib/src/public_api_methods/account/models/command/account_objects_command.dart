import 'package:xrpl_flutter_sdk/xrpl_flutter_sdk.dart';

class AccountObjectsCommand implements XrpCommand {
  /// A unique identifier for the account, most commonly the account's Address.
  final String account;

  /// If true, the response only includes objects that would block this account from being deleted. The default is false.
  final bool? deletionBlockersOnly;

  /// A 20-byte hex string for the ledger version to use. (See Specifying Ledgers)
  final String? ledgerHash;

  /// The ledger index of the ledger to use, or a shortcut string to choose a ledger automatically. (See Specifying Ledgers)
  final dynamic ledgerIndex;

  /// The maximum number of objects to include in the results. Must be within the inclusive range 10 to 400 on non-admin connections. The default is 200.
  final int? limit;

  /// Value from a previous paginated response. Resume retrieving data where that response left off.
  final dynamic marker;

  /// Filter results by a ledger entry type. The valid types are: bridge, check, deposit_preauth, escrow, nft_offer, nft_page, offer, payment_channel, signer_list, state (trust line), and ticket.
  final String? type;

  AccountObjectsCommand({
    required this.account,
    this.deletionBlockersOnly,
    this.ledgerHash,
    this.ledgerIndex,
    this.limit,
    this.marker,
    this.type,
  });

  @override
  PublicApiCommands get method => PublicApiCommands.accountObjects;

  @override
  Map<String, dynamic> toRpcJson() {
    final data = {
      'account': account,
      'deletion_blockers_only': deletionBlockersOnly,
      'ledger_hash': ledgerHash,
      'ledger_index': ledgerIndex,
      'limit': limit,
      'marker': marker,
      'type': type,
    };

    data.removeWhere((key, value) => value == null);

    return {
      'method': method.value,
      "jsonrpc": "2.0",
      'params': [data]
    };
  }

  @override
  Map<String, dynamic> toWebSocketJson() {
    final data = {
      'account': account,
      'deletion_blockers_only': deletionBlockersOnly,
      'ledger_hash': ledgerHash,
      'ledger_index': ledgerIndex,
      'limit': limit,
      'marker': marker,
      "command": method.value,
    };

    data.removeWhere((key, value) => value == null);

    return data;
  }
}
