import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import '../models/account.dart';
import '../models/bot.dart';
import '../models/trade_log.dart';
import 'package:flutter/material.dart';

class TradingEngine extends ChangeNotifier {
  final Account account = Account();
  final List<TradeLog> logs = [];
  final List<Bot> bots = [
    Bot(id: 'bram', name: 'BRAM', icon: '🟠', color: const Color(0xFFFF9800), status: BotStatus.active),
    Bot(id: 'ilsa', name: 'ILSA', icon: '⚪', color: const Color(0xFFFFFFFF), status: BotStatus.active),
    Bot(id: 'holt', name: 'HOLT', icon: '🟣', color: const Color(0xFFE040FB), status: BotStatus.active),
    Bot(id: 'kett', name: 'KETT', icon: '🟢', color: const Color(0xFF00E676), status: BotStatus.paused),
    Bot(id: 'rigo', name: 'RIGO', icon: '🔵', color: const Color(0xFF2979FF), status: BotStatus.active),
  ];

  Timer? _timer;
  final Random _rng = Random();

  // Simulated EMA state
  double _ema50 = 1.0850;
  double _ema200 = 1.0820;

  void startSimulation() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 4), (_) => _simulateTick());
  }

  void stopSimulation() {
    _timer?.cancel();
  }

  void _simulateTick() {
    // Fake market movement
    final change = (_rng.nextDouble() - 0.48) * 0.002;
    _ema50 = _ema50 * 0.98 + (_ema50 + change) * 0.02;
    _ema200 = _ema200 * 0.995 + (_ema50) * 0.005;

    final activeBots = bots.where((b) => b.status == BotStatus.active).toList();
    if (activeBots.isEmpty) return;

    final bot = activeBots[_rng.nextInt(activeBots.length)];

    // Simple EMA crossover + Lumo Edge mock
    final isBullish = _ema50 > _ema200;
    final lumoEdge = _rng.nextDouble() > 0.35; // 65% filter

    if (lumoEdge) {
      final isProfit = _rng.nextDouble() < 0.68; // ~68% win rate
      final amount = 15 + _rng.nextDouble() * 180;
      final signed = isProfit ? amount : -amount * 0.6;

      account.currentBalance += signed;
      account.totalPnl += signed;
      account.balanceHistory.add(account.currentBalance);
      if (account.balanceHistory.length > 40) {
        account.balanceHistory.removeAt(0);
      }

      // Update win rate roughly
      final wins = logs.where((l) => l.isProfit).length + (isProfit ? 1 : 0);
      final total = logs.length + 1;
      account.winRate = (wins / total * 100);

      bot.pnl += signed;

      final action = isProfit ? 'SETTLE' : (_rng.nextBool() ? 'BUY' : 'SELL');
      final messages = [
        'EMA50 crossed EMA200 - ${isBullish ? "LONG" : "SHORT"}',
        'Lumo Edge confirmed - entry taken',
        'Profit locked & reopened immediately',
        'Scalp closed on 0.8R',
        'Trailing stop hit - partial close',
      ];

      logs.insert(
        0,
        TradeLog(
          botName: bot.name,
          action: action,
          amount: signed,
          message: messages[_rng.nextInt(messages.length)],
          time: DateTime.now(),
          isProfit: isProfit,
        ),
      );

      if (logs.length > 50) logs.removeLast();
      notifyListeners();
    }
  }

  void toggleBot(String id) {
    final bot = bots.firstWhere((b) => b.id == id);
    bot.status = bot.status == BotStatus.active ? BotStatus.paused : BotStatus.active;
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
