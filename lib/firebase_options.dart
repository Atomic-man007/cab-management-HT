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
    apiKey: 'AIzaSyDsAI9zdtdxw3MEgbHeBaqSq9-6wYQaXIw',
    appId: '1:936276710414:android:10a8be66e1ef8c6fe6d85f',
    messagingSenderId: '936276710414',
    projectId: 'cab-management-a9111',
    databaseURL: 'https://cab-management-a9111-default-rtdb.firebaseio.com',
    storageBucket: 'cab-management-a9111.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBk6ae7-UuQIeycAG_3yQWhX4Wt3W-SQsY',
    appId: '1:936276710414:ios:ab31d3f5f8848833e6d85f',
    messagingSenderId: '936276710414',
    projectId: 'cab-management-a9111',
    databaseURL: 'https://cab-management-a9111-default-rtdb.firebaseio.com',
    storageBucket: 'cab-management-a9111.appspot.com',
    iosClientId: '936276710414-4j4iinjjv3rssic3e8i1opd1dl95hnan.apps.googleusercontent.com',
    iosBundleId: 'com.example.cabManagement',
  );
}
