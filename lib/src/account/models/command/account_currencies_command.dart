import 'package:xrpl_flutter_sdk/xrpl_flutter_sdk.dart';

/// The [AccountCurrencies] command retrieves a list of currencies that an account can send or receive, based on its trust lines.
/// (This is not a thoroughly confirmed list, but it can be used to populate user interfaces.) [Source](https://github.com/XRPLF/rippled/blob/df966a9ac6dd986585ecccb206aff24452e41a30/src/ripple/rpc/handlers/AccountCurrencies.cpp)
class AccountCurrenciesCommand implements XrpCommand {
  /// Look up currencies this account can send or receive. Updated in: rippled 1.11.0
  final String account;

  /// A 20-byte hex string for the ledger version to use. (See Specifying Ledgers)
  final String? ledgerHash;

  /// Can be Number or String	The ledger index of the ledger to use, or a shortcut string to choose a ledger automatically. (See Specifying Ledgers)
  final dynamic ledgerIndex;

  AccountCurrenciesCommand({
    required this.account,
    this.ledgerHash,
    this.ledgerIndex,
  });

  @override
  Map<String, dynamic> toRpcJson() {
    final data = {
      'account': account,
      'ledger_hash': ledgerHash,
      'ledger_index': ledgerIndex,
      'method': method.value,
    };
    data.removeWhere((key, value) => value == null);

    return {
      'method': PublicApiCommands.accountCurrencies.value,
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
      'command': method.value,
    };
    data.removeWhere((key, value) => value == null);

    return data;
  }

  @override
  PublicApiCommands get method => PublicApiCommands.accountCurrencies;
}
