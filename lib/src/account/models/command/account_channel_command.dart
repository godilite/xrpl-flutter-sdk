import 'package:xrpl_flutter_sdk/xrpl_flutter_sdk.dart';

/// The account_channels method returns information about an account's Payment Channels.
/// This includes only channels where the specified account is the channel's source, not the destination.
/// (A channel's "source" and "owner" are the same.) All information retrieved is relative to a particular version of the ledger.
/// [Source](https://github.com/XRPLF/rippled/blob/master/src/ripple/rpc/handlers/AccountChannels.cpp)
class AccountChannelCommand implements XrpCommand {
  /// Address	Yes	Look up channels where this account is the channel's owner/source.
  final String account;

  /// A second account; if provided, filter results to payment channels whose destination is this account.
  final String? destinationAccount;

  /// A 20-byte hex string for the ledger version to use. (See Specifying Ledgers)
  final String? ledgerHash;

  /// ledger_index	Number or String	No	The ledger index of the ledger to use, or a shortcut string to choose a ledger automatically. (See Specifying Ledgers)
  final String? ledgerIndex;

  /// Limit the number of transactions to retrieve. Cannot be less than 10 or more than 400. Positive values outside this range are replaced with the closest valid option. The default is 200.
  final int? limit;

  ///	Value from a previous paginated response. Resume retrieving data where that response left off.
  final dynamic marker;

  AccountChannelCommand({
    required this.account,
    this.destinationAccount,
    this.ledgerHash,
    this.ledgerIndex,
    this.limit,
    this.marker,
  });

  @override
  Map<String, dynamic> toRpcJson() {
    final data = {
      'account': account,
      'destination_account': destinationAccount,
      'ledger_hash': ledgerHash,
      'ledger_index': ledgerIndex,
      'limit': limit,
      'marker': marker,
    };

    data.removeWhere((key, value) => value == null);

    return {
      'method': PublicApiCommands.accountChannels.value,
      "jsonrpc": "2.0",
      'params': [data]
    };
  }

  @override
  Map<String, dynamic> toWebSocketJson() {
    final data = {
      'account': account,
      'destination_account': destinationAccount,
      'ledger_hash': ledgerHash,
      'ledger_index': ledgerIndex,
      'limit': limit,
      'marker': marker,
    };

    data.removeWhere((key, value) => value == null);

    return data;
  }

  @override
  PublicApiCommands get method => PublicApiCommands.accountChannels;
}
