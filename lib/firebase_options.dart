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
    apiKey: 'AIzaSyC4XHLW99ogJzm68a4na3Mn8K1N-T_zT7M',
    appId: '1:948233784870:web:d9606e974a2a73e7ff60e7',
    messagingSenderId: '948233784870',
    projectId: 'webproject-b2a25',
    authDomain: 'webproject-b2a25.firebaseapp.com',
    storageBucket: 'webproject-b2a25.appspot.com',
    measurementId: 'G-9836G2ZFVY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAyDoxvPGaiG6YJ-vAh9VbX_QBBDDCI9aM',
    appId: '1:948233784870:android:43e7677777388bcfff60e7',
    messagingSenderId: '948233784870',
    projectId: 'webproject-b2a25',
    storageBucket: 'webproject-b2a25.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3w8g61n-lVvENiAO_6gQSy0YOVrblRmA',
    appId: '1:948233784870:ios:70b73e03ac60b66aff60e7',
    messagingSenderId: '948233784870',
    projectId: 'webproject-b2a25',
    storageBucket: 'webproject-b2a25.appspot.com',
    iosBundleId: 'com.example.untitled3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3w8g61n-lVvENiAO_6gQSy0YOVrblRmA',
    appId: '1:948233784870:ios:78aad9c3a42dd590ff60e7',
    messagingSenderId: '948233784870',
    projectId: 'webproject-b2a25',
    storageBucket: 'webproject-b2a25.appspot.com',
    iosBundleId: 'com.example.untitled3.RunnerTests',
  );
}