import 'package:flutter/material.dart';
import '../models/bot.dart';
import '../theme/app_theme.dart';

class BotCard extends StatelessWidget {
  final Bot bot;
  final VoidCallback onTap;

  const BotCard({super.key, required this.bot, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isActive = bot.status == BotStatus.active;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: AppTheme.cardBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isActive ? bot.color.withOpacity(0.6) : Colors.white12,
            width: 1.2,
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: bot.color.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 1,
                  )
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(bot.icon, style: const TextStyle(fontSize: 26)),
            const SizedBox(height: 6),
            Text(bot.name,
                style: TextStyle(
                    color: isActive ? bot.color : Colors.white60,
                    fontSize: 13,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? AppTheme.neonGreen : Colors.grey,
                boxShadow: isActive
                    ? [
                        BoxShadow(
                          color: AppTheme.neonGreen.withOpacity(0.6),
                          blurRadius: 6,
                        )
                      ]
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
