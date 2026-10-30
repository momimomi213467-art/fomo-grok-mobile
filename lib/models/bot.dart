import 'package:flutter/material.dart';

enum BotStatus { active, paused, offline }

class Bot {
  final String id;
  final String name;
  final String icon;
  final Color color;
  BotStatus status;
  double pnl;

  Bot({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    this.status = BotStatus.offline,
    this.pnl = 0.0,
  });
}
