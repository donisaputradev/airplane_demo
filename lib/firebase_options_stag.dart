// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options_stag.dart';
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
    apiKey: 'AIzaSyCzDonpLU633FMsdWfcdC2PlrLb_VuxDdc',
    appId: '1:806867048106:web:cd30c450927b534928a2d3',
    messagingSenderId: '806867048106',
    projectId: 'airplanedemo-157e8',
    authDomain: 'airplanedemo-157e8.firebaseapp.com',
    storageBucket: 'airplanedemo-157e8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXU2s6iSil5HTArxstfAz-DdkhOFliPUk',
    appId: '1:806867048106:android:55acdb0cf57caed128a2d3',
    messagingSenderId: '806867048106',
    projectId: 'airplanedemo-157e8',
    storageBucket: 'airplanedemo-157e8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB179lKRo8y4GtvruFIb3B82KTV72yv1N8',
    appId: '1:806867048106:ios:2922bfb56e3359af28a2d3',
    messagingSenderId: '806867048106',
    projectId: 'airplanedemo-157e8',
    storageBucket: 'airplanedemo-157e8.appspot.com',
    iosClientId: '806867048106-1kk33r8741d73rt8k9lte8jvrbk0j5c3.apps.googleusercontent.com',
    iosBundleId: 'com.donisaputra.airplane.stag',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB179lKRo8y4GtvruFIb3B82KTV72yv1N8',
    appId: '1:806867048106:ios:2922bfb56e3359af28a2d3',
    messagingSenderId: '806867048106',
    projectId: 'airplanedemo-157e8',
    storageBucket: 'airplanedemo-157e8.appspot.com',
    iosClientId: '806867048106-1kk33r8741d73rt8k9lte8jvrbk0j5c3.apps.googleusercontent.com',
    iosBundleId: 'com.donisaputra.airplane.stag',
  );
}