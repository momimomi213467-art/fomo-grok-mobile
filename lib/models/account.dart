class Account {
  double currentBalance;
  double totalPnl;
  double winRate;
  List<double> balanceHistory;

  Account({
    this.currentBalance = 14833.89,
    this.totalPnl = 3392.48,
    this.winRate = 69.6,
    List<double>? balanceHistory,
  }) : balanceHistory = balanceHistory ??
            List.generate(30, (i) => 11000 + i * 120 + (i * i * 1.5));
}
