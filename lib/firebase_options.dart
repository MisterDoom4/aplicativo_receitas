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
    apiKey: 'AIzaSyBguUshS3Xsie6V7y0I-H_rniRZUT8Z0FE',
    appId: '1:890694890136:web:0243c056b03b079b6f96ed',
    messagingSenderId: '890694890136',
    projectId: 'receitas-c6403',
    authDomain: 'receitas-c6403.firebaseapp.com',
    storageBucket: 'receitas-c6403.appspot.com',
    measurementId: 'G-2QDMT8G771',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDtVbXg4ySBIEkNIrTGOypsXICkcScbTOQ',
    appId: '1:890694890136:android:6b8a9ac022f5224e6f96ed',
    messagingSenderId: '890694890136',
    projectId: 'receitas-c6403',
    storageBucket: 'receitas-c6403.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBzxb5d0zUqXeGir_i_TWksIrH6_TykbSo',
    appId: '1:890694890136:ios:6776767f8542d2696f96ed',
    messagingSenderId: '890694890136',
    projectId: 'receitas-c6403',
    storageBucket: 'receitas-c6403.appspot.com',
    iosClientId:
        '890694890136-tkh9kve2jfvdom58rri4u41lq1j4dm36.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBzxb5d0zUqXeGir_i_TWksIrH6_TykbSo',
    appId: '1:890694890136:ios:6776767f8542d2696f96ed',
    messagingSenderId: '890694890136',
    projectId: 'receitas-c6403',
    storageBucket: 'receitas-c6403.appspot.com',
    iosClientId:
        '890694890136-tkh9kve2jfvdom58rri4u41lq1j4dm36.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication1',
  );
}
