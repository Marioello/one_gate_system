import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';
import 'pages/home/home.dart';
import 'pages/page_wrapper.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserAuth?>(context);

    if (user == null) {
      return const HomePage();
    } else {
      // return const DashboardLayout2();
      return const PageWrapper();
    }
  }
}
