import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// The `DefaultFirebaseOptions` class provides static FirebaseOptions based on the current platform,
/// including configurations for web, Android, iOS, macOS, and Windows.
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
    apiKey: 'AIzaSyDkg0C9vWtgDwm4bNNOqZrGOEqgr0D7EYc',
    appId: '1:505947007959:web:e2ee283f9a1471d4e0b992',
    messagingSenderId: '505947007959',
    projectId: 'user-comments-assignment',
    authDomain: 'user-comments-assignment.firebaseapp.com',
    storageBucket: 'user-comments-assignment.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBUiMDbWAk-eS3JOs-NF0BgVTSRVZ-nqOQ',
    appId: '1:505947007959:android:7d3a6c1d069b14bbe0b992',
    messagingSenderId: '505947007959',
    projectId: 'user-comments-assignment',
    storageBucket: 'user-comments-assignment.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC3N_9VRpNuNqSmwIXw5qKybc82AuolQYw',
    appId: '1:505947007959:ios:35c36bea352609b1e0b992',
    messagingSenderId: '505947007959',
    projectId: 'user-comments-assignment',
    storageBucket: 'user-comments-assignment.appspot.com',
    iosBundleId: 'com.example.userCommentsAssignment',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC3N_9VRpNuNqSmwIXw5qKybc82AuolQYw',
    appId: '1:505947007959:ios:35c36bea352609b1e0b992',
    messagingSenderId: '505947007959',
    projectId: 'user-comments-assignment',
    storageBucket: 'user-comments-assignment.appspot.com',
    iosBundleId: 'com.example.userCommentsAssignment',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDkg0C9vWtgDwm4bNNOqZrGOEqgr0D7EYc',
    appId: '1:505947007959:web:951e1ad2bb60e3d1e0b992',
    messagingSenderId: '505947007959',
    projectId: 'user-comments-assignment',
    authDomain: 'user-comments-assignment.firebaseapp.com',
    storageBucket: 'user-comments-assignment.appspot.com',
  );
}
