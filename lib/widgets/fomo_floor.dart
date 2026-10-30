import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/bot.dart';
import '../services/trading_engine.dart';
import '../theme/app_theme.dart';
import 'glowing_card.dart';

class FomoFloor extends StatelessWidget {
  const FomoFloor({super.key});

  @override
  Widget build(BuildContext context) {
    final bots = context.watch<TradingEngine>().bots;

    return GlowingCard(
      glowColor: AppTheme.neonCyan,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('THE FOMO FLOOR',
                  style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 11,
                      letterSpacing: 1.1)),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppTheme.neonGreen.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text('LIVE',
                    style: TextStyle(
                        color: AppTheme.neonGreen,
                        fontSize: 10,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 14),
          // Grid of bots as "stations"
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.95,
            ),
            itemCount: bots.length,
            itemBuilder: (ctx, i) {
              final bot = bots[i];
              final isActive = bot.status == BotStatus.active;
              return GestureDetector(
                onTap: () =>
                    context.read<TradingEngine>().toggleBot(bot.id),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isActive
                          ? bot.color.withOpacity(0.7)
                          : Colors.white12,
                      width: 1.2,
                    ),
                    boxShadow: isActive
                        ? [
                            BoxShadow(
                              color: bot.color.withOpacity(0.25),
                              blurRadius: 10,
                              spreadRadius: 1,
                            )
                          ]
                        : null,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(bot.icon, style: const TextStyle(fontSize: 28)),
                      const SizedBox(height: 6),
                      Text(bot.name,
                          style: TextStyle(
                              color: isActive ? bot.color : Colors.white54,
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 3),
                      Text(
                        isActive ? 'ACTIVE' : 'PAUSED',
                        style: TextStyle(
                          color: isActive
                              ? AppTheme.neonGreen
                              : AppTheme.textSecondary,
                          fontSize: 9,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
