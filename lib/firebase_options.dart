// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAWutuDTRWEpXD9kMbVrcsdrX2K5J1bdMQ',
    appId: '1:990298675347:android:e2c1a32b89bffb01d15566',
    messagingSenderId: '990298675347',
    projectId: 'chatify-15ecd',
    storageBucket: 'chatify-15ecd.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAIVqZ8bGhICzUVwUCGNlN0DaGiN8IvTgQ',
    appId: '1:990298675347:ios:6cefc5168f1a592ed15566',
    messagingSenderId: '990298675347',
    projectId: 'chatify-15ecd',
    storageBucket: 'chatify-15ecd.firebasestorage.app',
    androidClientId: '990298675347-iqp7almh4t1tst8lnmvfh40g7bpdcs5p.apps.googleusercontent.com',
    iosClientId: '990298675347-vtlt6u8t535oshbqvi9toi5ls0946cs5.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatify',
  );

}