import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../services/trading_engine.dart';
import '../theme/app_theme.dart';
import 'glowing_card.dart';

class BalanceHeader extends StatelessWidget {
  const BalanceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final engine = context.watch<TradingEngine>();
    final acc = engine.account;
    final fmt = NumberFormat.currency(symbol: '\\$', decimalDigits: 2);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GlowingCard(
                glowColor: AppTheme.neonCyan,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CURRENT BALANCE',
                        style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 10,
                            letterSpacing: 1.2)),
                    const SizedBox(height: 4),
                    Text(fmt.format(acc.currentBalance),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: GlowingCard(
                glowColor: AppTheme.neonGreen,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('TOTAL PNL',
                        style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 10,
                            letterSpacing: 1.2)),
                    const SizedBox(height: 4),
                    Text(
                      '+${fmt.format(acc.totalPnl)}',
                      style: const TextStyle(
                          color: AppTheme.neonGreen,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        GlowingCard(
          glowColor: AppTheme.neonBlue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('WIN RATE',
                      style: TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 10,
                          letterSpacing: 1.2)),
                  const SizedBox(height: 2),
                  Text(
                    '${acc.winRate.toStringAsFixed(1)}%',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.neonGreen.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.neonGreen.withOpacity(0.5)),
                ),
                child: const Text('BOT 5 • LIVE',
                    style: TextStyle(
                        color: AppTheme.neonGreen,
                        fontSize: 11,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
