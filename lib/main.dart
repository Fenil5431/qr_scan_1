import 'package:flutter/material.dart';
import 'package:qr_scan_1/SplashScreen.dart';

main() {
  runApp(QRCode());
}

class QRCode extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
