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
    apiKey: 'AIzaSyDIjgLmv4sYFqLkqpf1dnptp5lgJ2-YyMM',
    appId: '1:777025100670:web:7e347c0985f6bcb317712f',
    messagingSenderId: '777025100670',
    projectId: 'cashtrash',
    authDomain: 'cashtrash.firebaseapp.com',
    storageBucket: 'cashtrash.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFGRp2KRuSVip5jT_plsfd8ZOWINj1TLw',
    appId: '1:777025100670:android:2fc5726904afca2017712f',
    messagingSenderId: '777025100670',
    projectId: 'cashtrash',
    storageBucket: 'cashtrash.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPiDC98pohlniRJ2JmPydeZX2zkbdfr4w',
    appId: '1:777025100670:ios:20620d7a5ff313f517712f',
    messagingSenderId: '777025100670',
    projectId: 'cashtrash',
    storageBucket: 'cashtrash.appspot.com',
    iosClientId: '777025100670-18gfbc80psdspehnqadcal0algq77em3.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseAuth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAPiDC98pohlniRJ2JmPydeZX2zkbdfr4w',
    appId: '1:777025100670:ios:20620d7a5ff313f517712f',
    messagingSenderId: '777025100670',
    projectId: 'cashtrash',
    storageBucket: 'cashtrash.appspot.com',
    iosClientId: '777025100670-18gfbc80psdspehnqadcal0algq77em3.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseAuth',
  );
}