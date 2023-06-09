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
    apiKey: 'AIzaSyBSsID5ChNqjaQqs025PocCpb8hXgjwFDo',
    appId: '1:73192681361:web:6b85fb1dad5d054b9e7430',
    messagingSenderId: '73192681361',
    projectId: 'proyecto2-8efa8',
    authDomain: 'proyecto2-8efa8.firebaseapp.com',
    storageBucket: 'proyecto2-8efa8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDspsApwMm8YWbbdO4gLkiEujUajm0pDbc',
    appId: '1:73192681361:android:03da3e5ffe198f2e9e7430',
    messagingSenderId: '73192681361',
    projectId: 'proyecto2-8efa8',
    storageBucket: 'proyecto2-8efa8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCMUXISSF0RggaJOo1xSVz0HrN2hnrQ-Fc',
    appId: '1:73192681361:ios:13e16a2d25a095419e7430',
    messagingSenderId: '73192681361',
    projectId: 'proyecto2-8efa8',
    storageBucket: 'proyecto2-8efa8.appspot.com',
    iosClientId: '73192681361-ssl2b531eluuc0s9paucvp3l5o5a3d4g.apps.googleusercontent.com',
    iosBundleId: 'com.example.damU4Proyecto219400616',
  );
}
