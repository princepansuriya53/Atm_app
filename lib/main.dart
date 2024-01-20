// ignore_for_file: deprecated_member_use
import 'package:atm_apps/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 69, 28, 219)),
      ),
      title: "My ATM",
      home: homescreen(),
    );
  }
}
