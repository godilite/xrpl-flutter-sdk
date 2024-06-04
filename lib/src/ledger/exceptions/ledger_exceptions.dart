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
