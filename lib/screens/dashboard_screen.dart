import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/trading_engine.dart';
import '../theme/app_theme.dart';
import '../widgets/activity_log.dart';
import '../widgets/balance_chart.dart';
import '../widgets/balance_header.dart';
import '../widgets/bot_card.dart';
import '../widgets/fomo_floor.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: AppTheme.neonCyan.withOpacity(0.5)),
                    ),
                    child: const Text('FOMO × GROK',
                        style: TextStyle(
                            color: AppTheme.neonCyan,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1)),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppTheme.neonGreen.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: AppTheme.neonGreen.withOpacity(0.4)),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.circle,
                            size: 8, color: AppTheme.neonGreen),
                        SizedBox(width: 6),
                        Text('LIVE',
                            style: TextStyle(
                                color: AppTheme.neonGreen,
                                fontSize: 11,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const BalanceHeader(),
                    const SizedBox(height: 12),
                    const BalanceChart(),
                    const SizedBox(height: 12),
                    const ActivityLog(),
                    const SizedBox(height: 12),
                    const FomoFloor(),
                    const SizedBox(height: 16),

                    // Bottom horizontal bot cards
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('ACTIVE AGENTS',
                          style: TextStyle(
                              color: AppTheme.textSecondary,
                              fontSize: 11,
                              letterSpacing: 1.1)),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 110,
                      child: Consumer<TradingEngine>(
                        builder: (context, engine, _) {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: engine.bots.length,
                            itemBuilder: (ctx, i) {
                              final bot = engine.bots[i];
                              return BotCard(
                                bot: bot,
                                onTap: () => engine.toggleBot(bot.id),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
