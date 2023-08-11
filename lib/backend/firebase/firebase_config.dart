import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAEyioW65HdHpyRd8D3pxIeyOe2pJu-FRY",
            authDomain: "daily-routine-helper.firebaseapp.com",
            projectId: "daily-routine-helper",
            storageBucket: "daily-routine-helper.appspot.com",
            messagingSenderId: "121640673028",
            appId: "1:121640673028:web:c6dec0281b9c46737bfa51"));
  } else {
    await Firebase.initializeApp();
  }
}
