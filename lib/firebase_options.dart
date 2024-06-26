// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAvKoWQQOOIQ45wrXwutuDA5u4sFDVyi8M',
    appId: '1:427379275290:web:971758c60bf5872d1a03a3',
    messagingSenderId: '427379275290',
    projectId: 'easy-shopping-an-ecommer-53de3',
    authDomain: 'easy-shopping-an-ecommer-53de3.firebaseapp.com',
    storageBucket: 'easy-shopping-an-ecommer-53de3.appspot.com',
    measurementId: 'G-Q9JLVV6WEM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCmmUWBVcQxh4dauBOLMf7c1rVd6bdsho',
    appId: '1:427379275290:android:ffb0990dcebaf6581a03a3',
    messagingSenderId: '427379275290',
    projectId: 'easy-shopping-an-ecommer-53de3',
    storageBucket: 'easy-shopping-an-ecommer-53de3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDjN5r4SRzfTEo25RiJuPvNWzM1T4JrMhs',
    appId: '1:427379275290:ios:d8b5559ebff2cfa01a03a3',
    messagingSenderId: '427379275290',
    projectId: 'easy-shopping-an-ecommer-53de3',
    storageBucket: 'easy-shopping-an-ecommer-53de3.appspot.com',
    iosBundleId: 'com.example.easyshopApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDjN5r4SRzfTEo25RiJuPvNWzM1T4JrMhs',
    appId: '1:427379275290:ios:5e483cb42cebfca61a03a3',
    messagingSenderId: '427379275290',
    projectId: 'easy-shopping-an-ecommer-53de3',
    storageBucket: 'easy-shopping-an-ecommer-53de3.appspot.com',
    iosBundleId: 'com.example.easyshopApp.RunnerTests',
  );
}
