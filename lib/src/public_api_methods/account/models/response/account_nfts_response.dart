import 'package:xrpl_flutter_sdk/xrpl_flutter_sdk.dart';

class AccountNftsResponse implements XrpResponse {
  final AccountNftsResultResponse result;

  AccountNftsResponse({
    required this.result,
  });

  @override
  factory AccountNftsResponse.fromRpcJson(Map<String, dynamic> json) {
    return AccountNftsResponse(
      result: AccountNftsResultResponse.fromJson(json),
    );
  }

  @override
  factory AccountNftsResponse.fromWebSocketJson(Map<String, dynamic> json) {
    return AccountNftsResponse(
      result: AccountNftsResultResponse.fromJson(json['result']),
    );
  }
}

class Nft {
  /// A bit-map of boolean flags enabled for this NFToken.
  final int flags;

  /// The account that issued this NFToken.
  final String issuer;

  /// The unique identifier of this NFToken, in hexadecimal.
  final String nftTokenID;

  /// The unscrambled version of this token's taxon. Several tokens with the same taxon might represent instances of a limited series.
  final int nftTokenTaxon;

  /// The URI data associated with this NFToken, in hexadecimal.
  final String uri;

  /// The token sequence number of this NFToken, which is unique for its issuer.
  final int nftSerial;

  const Nft({
    required this.flags,
    required this.issuer,
    required this.nftTokenID,
    required this.nftTokenTaxon,
    required this.uri,
    required this.nftSerial,
  });

  factory Nft.fromJson(Map<String, dynamic> json) {
    return Nft(
      flags: json['Flags'] as int? ?? 0,
      issuer: json['Issuer'] as String? ?? '',
      nftTokenID: json['NFTokenID'] as String? ?? '',
      nftTokenTaxon: json['NFTokenTaxon'] as int? ?? 0,
      uri: json['URI'] as String? ?? '',
      nftSerial: json['nft_serial'] as int? ?? 0,
    );
  }
}

class AccountNftsResultResponse {
  /// The account that owns the list of NFTs.
  final String account;

  /// A list of NFTs owned by the account, formatted as NFT Objects.
  final List<Nft> accountNfts;

  /// The identifying hash of the ledger that was used to generate this response.
  final String? ledgerHash;

  /// The ledger index of the ledger that was used to generate this response.
  final int? ledgerIndex;

  /// The ledger index of the current in-progress ledger version, which was used to generate this response.
  final int? ledgerCurrentIndex;

  /// If included and set to true, the information in this response comes from a validated ledger version. Otherwise, the information is subject to change.
  final bool? validated;

  /// Server-defined value indicating the response is paginated. Pass this to the next call to resume where this call left off. Omitted when there are no additional pages after this one.
  final String? marker;

  const AccountNftsResultResponse({
    required this.account,
    required this.accountNfts,
    this.ledgerHash,
    this.ledgerIndex,
    this.ledgerCurrentIndex,
    this.validated,
    this.marker,
  });

  factory AccountNftsResultResponse.fromJson(Map<String, dynamic> json) {
    var nfts = (json['account_nfts'] as List).map((nft) => Nft.fromJson(nft)).toList();

    return AccountNftsResultResponse(
      account: json['account'] as String? ?? '',
      accountNfts: nfts,
      ledgerHash: json['ledger_hash'] as String?,
      ledgerIndex: json['ledger_index'] as int?,
      ledgerCurrentIndex: json['ledger_current_index'] as int?,
      validated: json['validated'] as bool?,
      marker: json['marker'] as String?,
    );
  }
}
