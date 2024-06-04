import 'package:xrpl_flutter_sdk/src/client/interfaces/xrp_args.dart';
import 'package:xrpl_flutter_sdk/src/utils/public_api_commands.dart';

class LedgerArgs implements XrpArgs {
  /// The ledger index of the ledger to use, or a shortcut string to choose a ledger automatically. (See Specifying Ledgers)[https://xrpl.org/docs/references/protocol/data-types/basic-data-types/#specifying-ledgers]
  String? ledgerIndex;

  /// A 32-byte hex string for the ledger version to use. (See Specifying Ledgers)[https://xrpl.org/docs/references/protocol/data-types/basic-data-types/#specifying-ledgers]
  String? ledgerHash;

  /// If true, return information on transactions in the specified ledger version. The default is false. Ignored if you did not specify a ledger version.
  bool? transactions;

  /// Provide full JSON-formatted information for transaction/account information instead of only hashes. The default is false. Ignored unless you request transactions, accounts, or both.
  bool? expand;

  ///  If true, include owner_funds field in the metadata of OfferCreate transactions in the response. The default is false. Ignored unless transactions are included and expand is true.
  bool? ownerFunds;

  /// 	If true, and transactions and expand are both also true, return transaction information in binary format (hexadecimal string) instead of JSON format.
  bool? binary;

  /// If true, and the command is requesting the current ledger, includes an array of queued transactions in the results.
  bool? queue;

  /// (Optional) Used for [WebsocketClient] A unique value to identify this request. The response to this request uses the same id field. This way, even if responses arrive out of order, you know which request prompted which response.
  dynamic id;

  LedgerArgs({
    this.ledgerIndex,
    this.transactions,
    this.expand,
    this.ownerFunds,
    this.binary,
    this.queue,
    this.id,
  });

  @override
  Map<String, dynamic> toWebSocketJson() {
    return {
      if (ledgerIndex != null) 'ledger_index': ledgerIndex,
      if (transactions != null) 'transactions': transactions,
      if (expand != null) 'expand': expand,
      if (ownerFunds != null) 'owner_funds': ownerFunds,
      if (binary != null) 'binary': binary,
      if (queue != null) 'queue': queue,
      'command': PublicApiCommands.ledger,
    };
  }

  @override
  Map<String, dynamic> toRpcJson() {
    return {
      'method': PublicApiCommands.ledger,
      'params': [
        {
          if (ledgerIndex != null) 'ledger_index': ledgerIndex,
          if (transactions != null) 'transactions': transactions,
          if (expand != null) 'expand': expand,
          if (ownerFunds != null) 'owner_funds': ownerFunds,
          if (binary != null) 'binary': binary,
          if (queue != null) 'queue': queue,
        }
      ],
    };
  }
}
