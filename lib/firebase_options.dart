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
    apiKey: 'AIzaSyDmbKBJkKu3uuqG4n0BkhufnvXX68u335U',
    appId: '1:267488540093:web:2c0a55d11396697c384ed4',
    messagingSenderId: '267488540093',
    projectId: 'smart-vote-20ab5',
    authDomain: 'smart-vote-20ab5.firebaseapp.com',
    storageBucket: 'smart-vote-20ab5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB-8jIyhlEbjrfeuRWYyPUBcanZ_L39YEY',
    appId: '1:267488540093:android:eb87bb02e4fbe649384ed4',
    messagingSenderId: '267488540093',
    projectId: 'smart-vote-20ab5',
    storageBucket: 'smart-vote-20ab5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDz05Zp8MZUtdvzpLpjBpdMv7dOlRo0M04',
    appId: '1:267488540093:ios:f4cd177604902df5384ed4',
    messagingSenderId: '267488540093',
    projectId: 'smart-vote-20ab5',
    storageBucket: 'smart-vote-20ab5.appspot.com',
    iosBundleId: 'com.example.smartVote',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDz05Zp8MZUtdvzpLpjBpdMv7dOlRo0M04',
    appId: '1:267488540093:ios:5f4886ea4b41d366384ed4',
    messagingSenderId: '267488540093',
    projectId: 'smart-vote-20ab5',
    storageBucket: 'smart-vote-20ab5.appspot.com',
    iosBundleId: 'com.example.smartVote.RunnerTests',
  );
}
