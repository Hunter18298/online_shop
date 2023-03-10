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
    apiKey: 'AIzaSyADvUDxsrBcGI1EZ8FDyBwmIHwNmwhTzmQ',
    appId: '1:895631252165:web:dd77d4eb2a96fd93476eac',
    messagingSenderId: '895631252165',
    projectId: 'online-shop-c3fe0',
    authDomain: 'online-shop-c3fe0.firebaseapp.com',
    storageBucket: 'online-shop-c3fe0.appspot.com',
    measurementId: 'G-EWENNY5RDP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAgwxsKrbO0HX9A01c31EwPISVqVUVR3HE',
    appId: '1:895631252165:android:8a2f67df31ba99bd476eac',
    messagingSenderId: '895631252165',
    projectId: 'online-shop-c3fe0',
    storageBucket: 'online-shop-c3fe0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQ0M2wGwnvH3lkKkrBKlMTAJycPhvzm6A',
    appId: '1:895631252165:ios:c2dbcec8ff852fae476eac',
    messagingSenderId: '895631252165',
    projectId: 'online-shop-c3fe0',
    storageBucket: 'online-shop-c3fe0.appspot.com',
    iosClientId: '895631252165-ffrkcfjjhj6p5p13a0etrbohc9iscr9o.apps.googleusercontent.com',
    iosBundleId: 'com.example.onlineshop',
  );
}
