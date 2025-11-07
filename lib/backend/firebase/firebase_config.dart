import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDA8T0N1viBg68jtXITXp4s_T_95QrHyXk",
            authDomain: "nutri-box-ltkzj1.firebaseapp.com",
            projectId: "nutri-box-ltkzj1",
            storageBucket: "nutri-box-ltkzj1.firebasestorage.app",
            messagingSenderId: "1022391841459",
            appId: "1:1022391841459:web:211ff68f78750c32f536c6"));
  } else {
    await Firebase.initializeApp();
  }
}
