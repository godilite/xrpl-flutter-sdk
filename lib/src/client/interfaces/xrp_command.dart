import 'package:xrpl_flutter_sdk/xrpl_flutter_sdk.dart';

interface class XrpCommand {
  Map<String, dynamic> toWebSocketJson() {
    throw UnimplementedError();
  }

  Map<String, dynamic> toRpcJson() {
    throw UnimplementedError();
  }

  PublicApiCommands get method {
    throw UnimplementedError();
  }
}
