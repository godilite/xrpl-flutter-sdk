import 'package:xrpl_flutter_sdk/src/exceptions/xrp_exceptions.dart';

void handleUniversalError(String errorCode) {
  switch (errorCode) {
    case 'amendmentBlocked':
      throw AmendmentBlockedException();
    case 'failedToForward':
      throw FailedToForwardException();
    case 'invalid_API_version':
      throw InvalidApiVersionException();
    case 'jsonInvalid':
      throw JsonInvalidException();
    case 'missingCommand':
      throw MissingCommandException();
    case 'noClosed':
      throw NoClosedException();
    case 'noCurrent':
      throw NoCurrentException();
    case 'noNetwork':
      throw NoNetworkException();
    case 'tooBusy':
      throw TooBusyException();
    case 'unknownCmd':
      throw UnknownCmdException();
    case 'wsTextRequired':
      throw WsTextRequiredException();
    case 'invalidParams':
      throw InvalidParamsException();
    case 'lgrNotFound':
      throw LgrNotFoundException();
    case 'noPermission':
      throw NoPermissionException();
    default:
      throw Exception('Unknown error code: $errorCode');
  }
}
