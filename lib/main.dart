import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tibobit_flutter/features/authentication/presentation/screens/authentication_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TiboBit App',
      debugShowCheckedModeBanner: false,
      home: const AuthenticationScreen(),
    );
  }
}
