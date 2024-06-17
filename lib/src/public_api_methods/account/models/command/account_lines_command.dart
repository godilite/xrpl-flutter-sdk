import 'package:xrpl_flutter_sdk/xrpl_flutter_sdk.dart';

/// The [AccountLines] method returns information about an account's trust lines, which contain balances in all non-XRP currencies and assets.
/// All information retrieved is relative to a particular version of the ledger.
class AccountLinesCommand implements XrpCommand {
  ///	String - Address	Look up trust lines connected to this account.
  final String account;

  /// ledger_hash	String	(Optional) A 20-byte hex string for the ledger version to use. (See Specifying Ledgers)
  final String? ledgerHash;

  /// ledger_index	Number or String	(Optional) The ledger index of the ledger to use, or a shortcut string to choose a ledger automatically. (See Specifying Ledgers)
  final dynamic ledgerIndex;

  /// peer	String - Address	(Optional) A second account; if provided, filter results to trust lines connecting the two accounts.
  final String? peer;

  /// limit	Number	(Optional) Limit the number of trust lines to retrieve. The server may return less than the specified limit, even if there are more pages of results. Must be within the inclusive range 10 to 400. Positive values outside this range are replaced with the closest valid option. The default is 200.
  final int? limit;

  /// marker	Marker	(Optional) Value from a previous paginated response. Resume retrieving data where that response left off.
  final dynamic marker;

  const AccountLinesCommand({
    required this.account,
    this.ledgerHash,
    this.ledgerIndex,
    this.peer,
    this.limit,
    this.marker,
  });

  @override
  PublicApiCommands get method => PublicApiCommands.accountLines;

  @override
  Map<String, dynamic> toRpcJson() {
    final data = {
      'account': account,
      'ledger_hash': ledgerHash,
      'ledger_index': ledgerIndex,
      'peer': peer,
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
      'peer': peer,
      'limit': limit,
      'marker': marker,
      'command': method.value,
    };

    data.removeWhere((key, value) => value == null);

    return data;
  }
}
