enum PublicApiCommands {
  ledger('ledger'),
  ledgerClosed('ledger_closed'),
  ledgerCurrent('ledger_current'),
  ledgerData('ledger_data'),
  accountChannels('account_channels'),
  accountCurrencies('account_currencies'),
  accountInfo('account_info'),
  accountLines('account_lines'),
  accountObjects('account_objects'),
  accountOffers('account_offers'),
  accountTx('account_tx'),
  accountNfts('account_nfts'),
  gatewayBalances('gateway_balances'),
  norippleCheck('noripple_check');

  final String value;

  const PublicApiCommands(this.value);

  static PublicApiCommands fromString(String value) => values.firstWhere((e) => e.value == value);

  Map<String, dynamic> toJson() => {'value': value};
}
