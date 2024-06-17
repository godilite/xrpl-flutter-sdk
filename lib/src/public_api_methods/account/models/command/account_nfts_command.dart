import 'package:xrpl_flutter_sdk/xrpl_flutter_sdk.dart';

/// The [AccountNfts] method returns a list of NFToken objects for the specified account. ((by the NonFungibleTokensV1_1 amendment.)[https://xrpl.org/resources/known-amendments/#nonfungibletokensv1_1])
class AccountNftsCommand implements XrpCommand {
  ///  account	String	The unique identifier of an account, typically the account's Address. The request returns a list of NFTs owned by this account.
  final String account;

  /// ledger_hash	String	(Optional) A 20-byte hex string for the ledger version to use. (See Specifying Ledgers)
  final String? ledgerHash;

  /// ledger_index	String or Number	(Optional) The ledger index of the ledger to use, or a shortcut string to choose a ledger automatically. (See Specifying Ledgers)
  final dynamic ledgerIndex;

  /// limit	Integer	(Optional) Limit the number of token pages to retrieve. Each page can contain up to 32 NFTs. The limit value cannot be lower than 20 or more than 400. Positive values outside this range are replaced with the closest valid option. The default is 100.
  final int? limit;

  /// marker	Marker	(Optional) Value from a previous paginated response. Resume retrieving data where that response left off.
  final dynamic marker;

  const AccountNftsCommand({
    required this.account,
    this.ledgerHash,
    this.ledgerIndex,
    this.limit,
    this.marker,
  });

  @override
  PublicApiCommands get method => PublicApiCommands.accountNfts;

  @override
  Map<String, dynamic> toRpcJson() {
    final data = {
      'account': account,
      'ledger_hash': ledgerHash,
      'ledger_index': ledgerIndex,
      'limit': limit,
      'marker': marker,
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
