import 'package:auth_frontend_flutter/screens/auth_screen.dart';
import 'package:flutter/material.dart';

class Src extends StatelessWidget {
  const Src({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AuthScreen(),
    );
  }
}