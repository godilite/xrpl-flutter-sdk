import 'package:xrpl_flutter_sdk/src/client/interfaces/xrp_response.dart';

class AccountChannelResponse implements XrpResponse {
  /// id of the request that prompted this response (only for websocket requests)
  final dynamic id;

  final AccountChannelResultResponse result;

  const AccountChannelResponse({
    required this.result,
    this.id,
  });

  @override
  factory AccountChannelResponse.fromRpcJson(Map<String, dynamic> json) {
    return AccountChannelResponse(
      result: AccountChannelResultResponse.toJson(json),
    );
  }

  @override
  factory AccountChannelResponse.fromWebSocketJson(Map<String, dynamic> json) {
    return AccountChannelResponse(
      result: AccountChannelResultResponse.toJson(json),
      id: json['id'],
    );
  }
}

class AccountChannelResultResponse {
  ///ledger_hash	String	(May be omitted)

  final String? ledgerHash;

  /// The identifying Hash of the ledger version used to generate this response.
  final int ledgerIndex;

  /// The address of the source/owner of the payment channels. This corresponds to the account field of the request.
  final String account;

  ///	Payment channels owned by this account. Updated in: rippled 1.5.0
  final List<Channel> channels;

  ///	(May be omitted) If true, the information in this response comes from a validated ledger version. Otherwise, the information is subject to change.
  final bool? validated;

  /// (May be omitted) The limit to how many channel objects were actually returned by this request.
  final int? limit;
// (May be omitted) Server-defined value for pagination. Pass this to the next call to resume getting results where this call left off. Omitted when there are no additional pages after this one.
  final dynamic marker;

  const AccountChannelResultResponse({
    required this.ledgerHash,
    required this.ledgerIndex,
    required this.account,
    required this.channels,
    required this.validated,
    required this.limit,
    required this.marker,
  });

  factory AccountChannelResultResponse.toJson(Map<String, dynamic> json) {
    return AccountChannelResultResponse(
      ledgerHash: json['result']['ledger_hash'] ?? '',
      ledgerIndex: json['result']['ledger_index'],
      account: json['result']['account'],
      channels: (json['result']['channels'] as List).map((e) => Channel.fromJson(e)).toList(),
      validated: json['result']['validated'] ?? false,
      limit: json['result']['limit'] ?? 0,
      marker: json['result']['marker'],
    );
  }
}

class Channel {
  /// The owner of the channel, as an Address.
  final String account;

  ///	The total amount of XRP, in drops allocated to this channel.
  final String amount;

  /// The total amount of XRP, in drops, paid out from this channel, as of the ledger version used. (You can calculate the amount of XRP left in the channel by subtracting balance from amount.)
  final String balance;

  /// A unique ID for this channel, as a 64-character hexadecimal string. This is also the ID of the channel object in the ledger's state data.
  final String channelId;

  ///	The destination account of the channel, as an Address. Only this account can receive the XRP in the channel while it is open.
  final String destinationAccount;

  /// The number of seconds the payment channel must stay open after the owner of the channel requests to close it.
  final int settleDelay;

  /// (May be omitted) The public key for the payment channel in the XRP Ledger's base58 format. Signed claims against this channel must be redeemed with the matching key pair.
  final String? publicKey;

  /// (May be omitted) The public key for the payment channel in hexadecimal format, if one was specified at channel creation. Signed claims against this channel must be redeemed with the matching key pair.
  final String? publicKeyHex;

  /// (May be omitted) Time, in seconds since the Ripple Epoch, when this channel is set to expire. This expiration date is mutable. If this is before the close time of the most recent validated ledger, the channel is expired.
  final int? expiration;

  ///	Unsigned Integer	(May be omitted) Time, in seconds since the Ripple Epoch, of this channel's immutable expiration, if one was specified at channel creation. If this is before the close time of the most recent validated ledger, the channel is expired.
  final int? cancelAfter;

  ///	Unsigned Integer	(May be omitted) A 32-bit unsigned integer to use as a source tag for payments through this payment channel, if one was specified at channel creation. This indicates the payment channel's originator or other purpose at the source account. Conventionally, if you bounce payments from this channel, you should specify this value in the DestinationTag of the return payment.
  final int? sourceTag;

  ///	Unsigned Integer	(May be omitted) A 32-bit unsigned integer to use as a destination tag for payments through this channel, if one was specified at channel creation. This indicates the payment channel's beneficiary or other purpose at the destination account.
  final int? destinationTag;

  const Channel({
    required this.account,
    required this.amount,
    required this.balance,
    required this.channelId,
    required this.destinationAccount,
    required this.settleDelay,
    this.publicKey,
    this.publicKeyHex,
    this.expiration,
    this.cancelAfter,
    this.sourceTag,
    this.destinationTag,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      account: json['account'],
      amount: json['amount'],
      balance: json['balance'],
      channelId: json['channel_id'],
      destinationAccount: json['destination_account'],
      settleDelay: json['settle_delay'],
      publicKey: json['public_key'],
      publicKeyHex: json['public_key_hex'],
      expiration: json['expiration'],
      cancelAfter: json['cancel_after'],
      sourceTag: json['source_tag'],
      destinationTag: json['destination_tag'],
    );
  }
}
