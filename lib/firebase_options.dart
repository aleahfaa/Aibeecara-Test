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
        return windows;
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
    apiKey: 'AIzaSyDIhZv9PpBVNA0_Bcc1-sLBb7MYH85JNp8',
    appId: '1:759311910524:web:a75f1690c650eb93a1abf9',
    messagingSenderId: '759311910524',
    projectId: 'aibeecara-todo',
    authDomain: 'aibeecara-todo.firebaseapp.com',
    storageBucket: 'aibeecara-todo.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbFbBBjVAXIF8Wlov0AqsufbYC7EZlp0o',
    appId: '1:759311910524:android:13dfd6dc5602d905a1abf9',
    messagingSenderId: '759311910524',
    projectId: 'aibeecara-todo',
    storageBucket: 'aibeecara-todo.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDm9BawXRtH6aQ8shHHt5jF7f7_VDi2o8A',
    appId: '1:759311910524:ios:6d2d7bd49d2a5c7ba1abf9',
    messagingSenderId: '759311910524',
    projectId: 'aibeecara-todo',
    storageBucket: 'aibeecara-todo.firebasestorage.app',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDm9BawXRtH6aQ8shHHt5jF7f7_VDi2o8A',
    appId: '1:759311910524:ios:6d2d7bd49d2a5c7ba1abf9',
    messagingSenderId: '759311910524',
    projectId: 'aibeecara-todo',
    storageBucket: 'aibeecara-todo.firebasestorage.app',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDIhZv9PpBVNA0_Bcc1-sLBb7MYH85JNp8',
    appId: '1:759311910524:web:7dbf41cb52592813a1abf9',
    messagingSenderId: '759311910524',
    projectId: 'aibeecara-todo',
    authDomain: 'aibeecara-todo.firebaseapp.com',
    storageBucket: 'aibeecara-todo.firebasestorage.app',
  );
}
