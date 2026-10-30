import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../services/trading_engine.dart';
import '../theme/app_theme.dart';
import 'glowing_card.dart';

class ActivityLog extends StatelessWidget {
  const ActivityLog({super.key});

  @override
  Widget build(BuildContext context) {
    final logs = context.watch<TradingEngine>().logs;

    return GlowingCard(
      glowColor: AppTheme.neonCyan,
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('ACTIVITY LOG',
                    style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 11,
                        letterSpacing: 1.1)),
                Text('${logs.length} resolved',
                    style: const TextStyle(
                        color: AppTheme.textSecondary, fontSize: 10)),
              ],
            ),
          ),
          SizedBox(
            height: 180,
            child: logs.isEmpty
                ? const Center(
                    child: Text('Waiting for signals...',
                        style: TextStyle(color: AppTheme.textSecondary)))
                : ListView.builder(
                    itemCount: logs.length,
                    itemBuilder: (ctx, i) {
                      final log = logs[i];
                      final color = log.isProfit
                          ? AppTheme.neonGreen
                          : AppTheme.neonRed;
                      final sign = log.isProfit ? '+' : '';
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 7),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.white.withOpacity(0.04)),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 48,
                              child: Text(log.botName,
                                  style: TextStyle(
                                      color: color,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              width: 55,
                              child: Text(log.action,
                                  style: const TextStyle(
                                      color: Colors.white70, fontSize: 11)),
                            ),
                            SizedBox(
                              width: 70,
                              child: Text(
                                '\\$sign${log.amount.toStringAsFixed(2)}',
                                style: TextStyle(
                                    color: color,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                log.message,
                                style: const TextStyle(
                                    color: AppTheme.textSecondary,
                                    fontSize: 10),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
