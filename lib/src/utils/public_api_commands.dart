enum PublicApiCommands {
  ledger('ledger'),
  ledgerClosed('ledger_closed'),
  ledgerCurrent('ledger_current'),
  ledgerData('ledger_data');

  final String value;

  const PublicApiCommands(this.value);

  static PublicApiCommands fromString(String value) => values.firstWhere((e) => e.value == value);
}
