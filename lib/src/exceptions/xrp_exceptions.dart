class AmendmentBlockedException implements Exception {
  final String message;
  AmendmentBlockedException(
      [this.message =
          'The server is amendment blocked and needs to be updated to the latest version to stay synced with the XRP Ledger network.']);

  @override
  String toString() => 'AmendmentBlockedException: $message';
}

class FailedToForwardException implements Exception {
  final String message;
  FailedToForwardException(
      [this.message = 'The server tried to forward this request to a P2P Mode server, but the connection failed.']);

  @override
  String toString() => 'FailedToForwardException: $message';
}

class InvalidApiVersionException implements Exception {
  final String message;
  InvalidApiVersionException([this.message = 'The server does not support the API version number from the request.']);

  @override
  String toString() => 'InvalidApiVersionException: $message';
}

class JsonInvalidException implements Exception {
  final String message;
  JsonInvalidException([this.message = 'The request is not a proper JSON object.']);

  @override
  String toString() => 'JsonInvalidException: $message';
}

class MissingCommandException implements Exception {
  final String message;
  MissingCommandException([this.message = 'The request did not specify a command field.']);

  @override
  String toString() => 'MissingCommandException: $message';
}

class NoClosedException implements Exception {
  final String message;
  NoClosedException(
      [this.message = 'The server does not have a closed ledger, typically because it has not finished starting up.']);

  @override
  String toString() => 'NoClosedException: $message';
}

class NoCurrentException implements Exception {
  final String message;
  NoCurrentException(
      [this.message =
          'The server does not know what the current ledger is, due to high load, network problems, validator failures, incorrect configuration, or some other problem.']);

  @override
  String toString() => 'NoCurrentException: $message';
}

class NoNetworkException implements Exception {
  final String message;
  NoNetworkException(
      [this.message =
          'The server is having trouble connecting to the rest of the XRP Ledger peer-to-peer network (and is not running in stand-alone mode).']);

  @override
  String toString() => 'NoNetworkException: $message';
}

class TooBusyException implements Exception {
  final String message;
  TooBusyException(
      [this.message =
          'The server is under too much load to do this command right now. Generally not returned if you are connected as an admin.']);

  @override
  String toString() => 'TooBusyException: $message';
}

class UnknownCmdException implements Exception {
  final String message;
  UnknownCmdException([this.message = 'The request does not contain a command that the rippled server recognizes.']);

  @override
  String toString() => 'UnknownCmdException: $message';
}

class WsTextRequiredException implements Exception {
  final String message;
  WsTextRequiredException([this.message = 'The request\'s opcode is not text.']);

  @override
  String toString() => 'WsTextRequiredException: $message';
}

class ActNotFoundException implements Exception {
  final String message;
  ActNotFoundException(
      [this.message =
          'The address specified in the [account] field of the request does not correspond to an account in the ledger.']);

  @override
  String toString() => 'ActNotFoundExcption: $message';
}

class InvalidParamsException implements Exception {
  final String message;
  InvalidParamsException(
      [this.message = 'One or more fields are specified incorrectly, or one or more required fields are missing.']);

  @override
  String toString() => 'InvalidParamsException: $message';
}

class LgrNotFoundException implements Exception {
  final String message;
  LgrNotFoundException(
      [this.message =
          'The ledger specified by the ledger_hash or ledger_index does not exist, or it does exist but the server does not have it.']);

  @override
  String toString() => 'LgrNotFoundException: $message';
}

class NoPermissionException implements Exception {
  final String message;
  NoPermissionException(
      [this.message =
          'You specified full or accounts as true, but are not connected to the server as an admin (usually, admin requires connecting on localhost).']);

  @override
  String toString() => 'NoPermissionException: $message';
}
