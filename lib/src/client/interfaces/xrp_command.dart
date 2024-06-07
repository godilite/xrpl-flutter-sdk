import 'package:xrpl_flutter_sdk/xrpl_flutter_sdk.dart';

abstract class XrpCommand {
  Map<String, dynamic> toWebSocketJson();
  Map<String, dynamic> toRpcJson();

  PublicApiCommands get method;
}
