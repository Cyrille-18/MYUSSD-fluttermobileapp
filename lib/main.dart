import 'package:flutter/material.dart';
import 'package:myussd_flutterapp/screens/Home_screen.dart';
import 'package:myussd_flutterapp/screens/Moneytransfer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'USSD APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(foregroundColor: Colors.white),
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
