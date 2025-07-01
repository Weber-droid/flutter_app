import 'package:flutter/material.dart';
import 'package:wallet_ui/wallet_home_screen.dart';

void main() {
  runApp(const WalletApp());
}

class WalletApp extends StatelessWidget {
  const WalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Roboto'),
      home: const WalletHome(),
    );
  }
}
