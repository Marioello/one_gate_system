import 'package:flutter/material.dart';
import 'package:one_gate_system/pages/home/body.dart';
import 'package:one_gate_system/shared/helper.dart';
import 'package:one_gate_system/pages/home/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFF8FBFF),
            Color(0xFFFCFDFD),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                NavBar(),
                Body(),
              ],
            ),
            textHelper('Copyright 2023 - OGS Team'),
          ],
        ),
      ),
    );
  }
}
