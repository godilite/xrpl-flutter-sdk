interface class XrpResponse {
  XrpResponse.fromWebSocketJson(Map<String, dynamic> json);
  XrpResponse.fromRpcJson(Map<String, dynamic> json);
}
