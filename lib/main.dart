import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:one_gate_system/config/firebase.dart';
import 'package:one_gate_system/models/user.dart';
import 'package:one_gate_system/services/auth.dart';
import 'package:one_gate_system/wrapper.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInit();
  await initializeDateFormatting('id_ID', null).then((_) {
    return runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserAuth?>.value(
      value: AuthService().user,
      initialData: null,
      child: const MaterialApp(
        title: 'One Gate System',
        home: Wrapper(),
      ),
    );
  }
}
