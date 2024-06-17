import 'package:xrpl_flutter_sdk/src/client/interfaces/xrp_command.dart';
import 'package:xrpl_flutter_sdk/src/utils/public_api_commands.dart';

class LedgerCurrentCommand implements XrpCommand {
  /// (Optional) Used for [WebsocketClient] A unique value to identify this request. The response to this request uses the same id field. This way, even if responses arrive out of order, you know which request prompted which response.
  dynamic id;

  LedgerCurrentCommand({
    this.id,
  });

  @override
  Map<String, dynamic> toRpcJson() {
    return {
      'method': method.value,
      "jsonrpc": "2.0",
      'params': [{}]
    };
  }

  @override
  Map<String, dynamic> toWebSocketJson() {
    return {
      'id': id,
      'command': method.value,
    };
  }

  @override
  PublicApiCommands get method => PublicApiCommands.ledgerCurrent;
}
