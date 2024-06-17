import 'package:xrpl_flutter_sdk/src/client/interfaces/xrp_command.dart';
import 'package:xrpl_flutter_sdk/src/public_api_methods/ledger/models/enums/ledger_type.dart';
import 'package:xrpl_flutter_sdk/src/utils/public_api_commands.dart';

class LedgerDataCommand implements XrpCommand {
  /// (Optional) Used for [WebsocketClient] A unique value to identify this request. The response to this request uses the same id field. This way, even if responses arrive out of order, you know which request prompted which response.
  dynamic id;

  /// (Optional) The unique identifying hash of the ledger to retrieve data from, as hexadecimal.
  String? ledgerHash;

  /// (Optional) The ledger index of the ledger to retrieve data from.
  int? ledgerIndex;

  /// (Optional) The limit of the number of ledger entries to retrieve.
  int? limit;

  /// (Optional) If true, return the data in binary format. If false, return the data in JSON format.
  bool? binary;

  /// Value from a previous paginated response. Resume retrieving data where that response left off.
  /// The format of the marker field is intentionally undefined. Each server can define a marker field as desired,
  /// so it may take the form of a string, a nested object, or another type. (See Pagination)[https://xrpl.org/docs/references/http-websocket-apis/api-conventions/markers-and-pagination/]
  dynamic marker;

  /// Filter results to a specific type of ledger entry. The valid types are: account, amendments, amm, check, deposit_preauth, directory, escrow, fee, hashes, nft_offer, offer, payment_channel, signer_list, state (trust line), and ticket.
  LedgerType? type;

  LedgerDataCommand({
    this.id,
    this.ledgerHash,
    this.ledgerIndex,
    this.limit,
    this.binary,
    this.marker,
    this.type,
  });

  @override
  Map<String, dynamic> toRpcJson() {
    final data = {
      'ledger_hash': ledgerHash,
      'ledger_index': ledgerIndex,
      'limit': limit,
      'binary': binary,
      'marker': marker,
      'type': type,
    };

    data.removeWhere((key, value) => value == null);

    return {
      'method': PublicApiCommands.ledgerData.value,
      "jsonrpc": "2.0",
      'params': [data]
    };
  }

  @override
  Map<String, dynamic> toWebSocketJson() {
    final data = {
      'id': id,
      'command': method.value,
      'ledger_hash': ledgerHash,
      'ledger_index': ledgerIndex,
      'limit': limit,
      'binary': binary,
      'marker': marker,
      'type': type,
    };

    data.removeWhere((key, value) => value == null);

    return data;
  }

  @override
  PublicApiCommands get method => PublicApiCommands.ledgerData;
}
