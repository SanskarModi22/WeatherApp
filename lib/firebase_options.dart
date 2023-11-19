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
    apiKey: 'AIzaSyBLW5AV7LnZS1Ujo5wCT4UjG3dpByvNdhg',
    appId: '1:422513023683:web:06068d5effc0ba249e6076',
    messagingSenderId: '422513023683',
    projectId: 'nova-weather-app-7ff2e',
    authDomain: 'nova-weather-app-7ff2e.firebaseapp.com',
    storageBucket: 'nova-weather-app-7ff2e.appspot.com',
    measurementId: 'G-VZ8MZ4BF28',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCvxim_tMRLmv8e8OdpncR_NgjrcLd4_Kk',
    appId: '1:422513023683:android:de13bce4cfb59ae89e6076',
    messagingSenderId: '422513023683',
    projectId: 'nova-weather-app-7ff2e',
    storageBucket: 'nova-weather-app-7ff2e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCoQbdzMvjnE9eKHVPO_7msKJ0t-tBP-y0',
    appId: '1:422513023683:ios:8133007dad244dea9e6076',
    messagingSenderId: '422513023683',
    projectId: 'nova-weather-app-7ff2e',
    storageBucket: 'nova-weather-app-7ff2e.appspot.com',
    iosBundleId: 'com.example.weatherApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCoQbdzMvjnE9eKHVPO_7msKJ0t-tBP-y0',
    appId: '1:422513023683:ios:eacdd5668af016eb9e6076',
    messagingSenderId: '422513023683',
    projectId: 'nova-weather-app-7ff2e',
    storageBucket: 'nova-weather-app-7ff2e.appspot.com',
    iosBundleId: 'com.example.weatherApp.RunnerTests',
  );
}