import 'package:xrpl_flutter_sdk/xrpl_flutter_sdk.dart';

abstract class XrpArgs {
  Map<String, dynamic> toWebSocketJson();
  Map<String, dynamic> toRpcJson();

  PublicApiCommands get method;
}
