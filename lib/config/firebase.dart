import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

firebaseInit() async {
  bool isWeb = kIsWeb;
  if (isWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBbviWiy_atuiQEv-_Fh3fXf_6LxZ3k6I8",
        projectId: "one-gate-system-81c5c",
        messagingSenderId: "393938400637",
        appId: "1:393938400637:web:929fb246369fbc2f47c814",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
}
