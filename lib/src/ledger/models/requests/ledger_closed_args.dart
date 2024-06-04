import 'package:xrpl_flutter_sdk/src/client/interfaces/xrp_args.dart';
import 'package:xrpl_flutter_sdk/src/utils/public_api_commands.dart';

class LedgerClosedArgs implements XrpArgs {
  // (Optional) Used for [WebsocketClient] A unique value to identify this request. The response to this request uses the same id field. This way, even if responses arrive out of order, you know which request prompted which response.
  String? id;

  @override
  Map<String, dynamic> toRpcJson() {
    return {
      'method': PublicApiCommands.ledgerClosed.value,
      'params': [{}]
    };
  }

  @override
  Map<String, dynamic> toWebSocketJson() {
    return {
      'id': id,
      'command': PublicApiCommands.ledgerClosed.value,
    };
  }
}
