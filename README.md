# FOMO × GROK Mobile

**Cyberpunk dark-neon trading dashboard** per Android, ispirato al dashboard desktop "FOMO x GROK".

Repository: https://github.com/momimomi213467-art/fomo-grok-mobile

## Caratteristiche UI
- Tema dark estremo con accenti neon (verde / rosso / ciano)
- Header con Current Balance, Total PnL, Win Rate
- Grafico Balance History con `fl_chart` + gradiente sotto la linea
- Activity Log scorrevole in tempo reale
- "The FOMO Floor" con griglia interattiva dei bot
- Card orizzontali dei bot (BRAM, ILSA, HOLT, KETT, RIGO)
- Glow effects e stile cyberpunk/hacker

## Logica (simulata / paper trading)
- Strategia **EMA 50 / EMA 200**
- Modulo **Lumo Edge** (filtro probabilistico)
- Chiusura in profitto + riapertura automatica
- Nessun ordine reale su broker (solo simulazione)

## Setup rapido (consigliato)

```bash
git clone https://github.com/momimomi213467-art/fomo-grok-mobile.git
cd fomo-grok-mobile

# Completa i file di piattaforma Android (importante!)
flutter create . --platforms=android

flutter pub get
flutter run
```

Oppure build APK:

```bash
flutter build apk --release
```

L'APK si trova in:  
`build/app/outputs/flutter-apk/app-release.apk`

## GitHub Actions
C'è un workflow (`.github/workflows/build-apk.yml`) che prova a compilare l'APK automaticamente ad ogni push su `main`.  
Dopo il primo `flutter create .` locale e push dei file generati, il workflow funzionerà meglio.

## Struttura principale
```
lib/
├─ main.dart
├─ theme/app_theme.dart
├─ models/
├─ services/trading_engine.dart   ← qui la logica EMA + Lumo Edge
├─ widgets/                     ← componenti glow + chart + log
└─ screens/dashboard_screen.dart
```

## Disclaimer
Questa è un'applicazione **dimostrativa di UI**.  
Non esegue trading reale.  
Se decidi di collegarla a un broker, usa solo capitali che puoi permetterti di perdere e rispetta le normative del tuo paese.
