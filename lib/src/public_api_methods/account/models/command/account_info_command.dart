import 'package:xrpl_flutter_sdk/xrpl_flutter_sdk.dart';

/// The account_info command retrieves information about an account, its activity, and its XRP balance.
/// All information retrieved is relative to a particular version of the ledger.
class AccountInfoCommand implements XrpCommand {
  /// (Optional) Used for [WebsocketClient] A unique value to identify this request. The response to this request uses the same id field. This way, even if responses arrive out of order, you know which request prompted which response.
  final dynamic id;

  /// (Optional) The API version to use. If omitted, uses version 1. For details, see API Versioning.
  final int? apiVersion;

  ///	The account to look up. Updated in: rippled 1.11.0
  final String account;

  /// A 20-byte hex string for the ledger version to use. (See Specifying Ledgers)
  final String? ledgerHash;

  /// The ledger index of the ledger to use, or a shortcut string to choose a ledger automatically. (See Specifying Ledgers)
  final dynamic ledgerIndex;

  /// If true, return stats about queued transactions sent by this account. Can only be used when querying for the data from the current open ledger. Not available from servers in Reporting Mode.
  final bool? queue;

  /// API v1: If true, return any SignerList objects associated with this account.
  /// API v2: Identical to v1, but also returns an invalidParams error if you provide a non-boolean value.
  final bool? signerLists;

  const AccountInfoCommand({
    this.id,
    required this.account,
    this.ledgerHash,
    this.ledgerIndex,
    this.queue,
    this.signerLists,
    this.apiVersion,
  });

  @override
  Map<String, dynamic> toRpcJson() {
    final data = {
      'account': account,
      'ledger_hash': ledgerHash,
      'ledger_index': ledgerIndex,
      'queue': queue,
      'signer_lists': signerLists,
      'method': method.value,
      'api_version': apiVersion,
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
      'queue': queue,
      'signer_lists': signerLists,
      'command': method.value,
      'api_version': apiVersion,
    };
    data.removeWhere((key, value) => value == null);

    return data;
  }

  @override
  PublicApiCommands get method => PublicApiCommands.accountInfo;
}
