import 'dart:convert';

import 'package:crypto/crypto.dart';

/// Utility function to extract the low 96 bits of a 256-bit value (NFTokenID).
String getLow96Bits(String nfTokenID) {
  // Convert the hexadecimal NFTokenID into a BigInt
  BigInt bigIntTokenID = BigInt.parse(nfTokenID, radix: 16);

  // Mask to extract the low 96 bits (12 bytes)
  BigInt mask = BigInt.from(2).pow(96) - BigInt.one;

  // Apply the mask to extract the low 96 bits
  BigInt low96Bits = bigIntTokenID & mask;

  // Convert the BigInt back to a hexadecimal string
  String low96Hex = low96Bits.toRadixString(16);

  // Pad with zeros if necessary to ensure length of 96 bits (24 hex digits)
  int paddingLength = 24 - low96Hex.length;
  if (paddingLength > 0) {
    low96Hex = '0' * paddingLength + low96Hex;
  }

  return low96Hex.toUpperCase(); // Ensure uppercase as per usual hex format
}

/// Simulated SHA-512Half hash function for illustration (replace with actual implementation).
String sha512Half(String input) {
  // Compute SHA-512 hash and take first 256 bits (sha512Half)
  final bytes = utf8.encode(input);
  final sha512Digest = sha512.convert(bytes);
  final sha512Hash = sha512Digest.toString();

  return sha512Hash.substring(0, 64);
}

/// Method to compute the NFTokenPage ID based on the described rules.(Rule)[https://xrpl.org/docs/references/protocol/ledger-data/ledger-entry-types/nftokenpage/]
String computeNftPageID(String accountID, String nfTokenID) {
  // Get low 96 bits of NFTokenID
  String low96NFTokenID = getLow96Bits(nfTokenID);

  // Concatenate accountID and low96NFTokenID
  String concatenated = accountID + low96NFTokenID;

  return sha512Half(concatenated);
}
