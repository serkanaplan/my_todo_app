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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAc1ei_0B2Iy2kqhme7X0dn0Nj15FpoCZU',
    appId: '1:951375469025:web:86575492aefdae81985aa0',
    messagingSenderId: '951375469025',
    projectId: 'hwatodoappdemo',
    authDomain: 'hwatodoappdemo.firebaseapp.com',
    storageBucket: 'hwatodoappdemo.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3qLi_OhJ3sJKOunE_pnVFwbvW8-SD91I',
    appId: '1:951375469025:android:827f04c86eb3dd6a985aa0',
    messagingSenderId: '951375469025',
    projectId: 'hwatodoappdemo',
    storageBucket: 'hwatodoappdemo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAlfMVo5s_dIz7XeMmHdCN7_Ted0ZF4MDA',
    appId: '1:951375469025:ios:56bb738fbdcbc8fd985aa0',
    messagingSenderId: '951375469025',
    projectId: 'hwatodoappdemo',
    storageBucket: 'hwatodoappdemo.appspot.com',
    iosBundleId: 'com.example.myTodoApp',
  );
}
