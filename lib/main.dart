import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'screens/dashboard_screen.dart';
import 'services/trading_engine.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Color(0xFF050505),
  ));
  runApp(const FomoGrokApp());
}

class FomoGrokApp extends StatelessWidget {
  const FomoGrokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TradingEngine()..startSimulation(),
      child: MaterialApp(
        title: 'FOMO × GROK',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkCyberpunk,
        home: const DashboardScreen(),
      ),
    );
  }
}
