class TradeLog {
  final String botName;
  final String action;
  final double amount;
  final String message;
  final DateTime time;
  final bool isProfit;

  TradeLog({
    required this.botName,
    required this.action,
    required this.amount,
    required this.message,
    required this.time,
    required this.isProfit,
  });
}
