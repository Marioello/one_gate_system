import 'package:flutter/material.dart';
import 'package:one_gate_system/pages/home/home.dart';
import 'package:one_gate_system/pages/dashboard/layout.dart';
import 'package:one_gate_system/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserAuth?>(context);

    if (user == null) {
      return const HomePage();
    } else {
      return const DashboardLayout();
    }
  }
}
