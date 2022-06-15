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
    apiKey: 'AIzaSyBqpI95o-HYOT5XmeaOC_P0OS19_DYEASc',
    appId: '1:631366430834:web:e31a6638bf9945923fd2eb',
    messagingSenderId: '631366430834',
    projectId: 'trajan-market',
    authDomain: 'trajan-market.firebaseapp.com',
    storageBucket: 'trajan-market.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB90HUd-HsbMlPxcGBONn8YxY_9EJeqVkw',
    appId: '1:631366430834:android:874fc20ba4b4ea6a3fd2eb',
    messagingSenderId: '631366430834',
    projectId: 'trajan-market',
    storageBucket: 'trajan-market.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCzPaD-RrMqOj8JsIpoPmUuodHE_SeitlE',
    appId: '1:631366430834:ios:e4a22629281773353fd2eb',
    messagingSenderId: '631366430834',
    projectId: 'trajan-market',
    storageBucket: 'trajan-market.appspot.com',
    iosClientId: '631366430834-gfgmfph70vk464sj1m7bqkpfvl939cii.apps.googleusercontent.com',
    iosBundleId: 'com.purboindra.trajanMarket',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCzPaD-RrMqOj8JsIpoPmUuodHE_SeitlE',
    appId: '1:631366430834:ios:e4a22629281773353fd2eb',
    messagingSenderId: '631366430834',
    projectId: 'trajan-market',
    storageBucket: 'trajan-market.appspot.com',
    iosClientId: '631366430834-gfgmfph70vk464sj1m7bqkpfvl939cii.apps.googleusercontent.com',
    iosBundleId: 'com.purboindra.trajanMarket',
  );
}