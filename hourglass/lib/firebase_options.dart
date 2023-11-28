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
    apiKey: 'AIzaSyDBfmE8-zLRtmHglL4GY2nH6-af0c6Wu1Y',
    appId: '1:191093454352:web:146e66324b27662cb4fc95',
    messagingSenderId: '191093454352',
    projectId: 'hourglass-bcaba',
    authDomain: 'hourglass-bcaba.firebaseapp.com',
    storageBucket: 'hourglass-bcaba.appspot.com',
    measurementId: 'G-SZME84JML0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBPWcaduQDOT9rlL4glJnC29q1a_Pkog30',
    appId: '1:191093454352:android:c9fcc1ab094a9139b4fc95',
    messagingSenderId: '191093454352',
    projectId: 'hourglass-bcaba',
    storageBucket: 'hourglass-bcaba.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTa_A7TUInkzhGBBjXa6dShDDHOrtT4f8',
    appId: '1:191093454352:ios:347c37f23204cf0bb4fc95',
    messagingSenderId: '191093454352',
    projectId: 'hourglass-bcaba',
    storageBucket: 'hourglass-bcaba.appspot.com',
    iosBundleId: 'com.example.hourglass',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBTa_A7TUInkzhGBBjXa6dShDDHOrtT4f8',
    appId: '1:191093454352:ios:355acb4cad824a39b4fc95',
    messagingSenderId: '191093454352',
    projectId: 'hourglass-bcaba',
    storageBucket: 'hourglass-bcaba.appspot.com',
    iosBundleId: 'com.example.hourglass.RunnerTests',
  );
}