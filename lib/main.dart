import 'package:fit_garages/dynamic_widget.dart';
import 'package:fit_garages/home_page.dart';
import 'package:fit_garages/razorpay_pseudo/screens/payment_page.dart';

import 'package:fit_garages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
