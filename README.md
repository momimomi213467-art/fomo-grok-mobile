# FOMO × GROK Mobile

Cyberpunk dark-neon trading dashboard per Android, ispirato al dashboard desktop "FOMO x GROK".

## Caratteristiche UI
- Tema dark estremo con accenti neon (verde/rosso/ciano)
- Header con Current Balance, Total PnL, Win Rate
- Grafico Balance History con `fl_chart` + gradiente
- Activity Log scorrevole in tempo reale
- "The FOMO Floor" con griglia interattiva dei bot
- Card orizzontali dei bot (BRAM, ILSA, HOLT, KETT, RIGO)

## Logica (simulata)
- Strategia EMA 50 / EMA 200
- Modulo "Lumo Edge" (filtro probabilistico)
- Chiusura in profitto + riapertura automatica
- Paper trading / simulazione (nessun ordine reale)

## Come buildare
```bash
flutter pub get
flutter run
# oppure
flutter build apk --release
```

Il workflow GitHub Actions genera automaticamente l'APK ad ogni push su `main`.

## Disclaimer
Questa è un'applicazione dimostrativa di UI. Non esegue trading reale. Usa a tuo rischio e solo con capitali che puoi permetterti di perdere se decidi di collegarla a un broker.
