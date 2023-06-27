import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:one_gate_system/pages/dashboard/layout.dart';
import 'package:one_gate_system/models/user.dart';
import 'package:one_gate_system/pages/home/home2.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserAuth?>(context);
    if (kDebugMode) {
      print('User: $user');
    }

    if (user == null) {
      return const HomePage2();
    } else {
      return const DashboardLayout();
    }
  }
}
