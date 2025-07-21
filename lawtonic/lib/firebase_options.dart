// import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
// import 'package:flutter/foundation.dart'
//     show defaultTargetPlatform, kIsWeb, TargetPlatform;
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// class DefaultFirebaseOptions {
//   static Future<FirebaseOptions> get currentPlatform async {
//     // dotenv is already loaded in main.dart, so just return
//     if (kIsWeb) return web;
//     switch (defaultTargetPlatform) {
//       case TargetPlatform.android:
//         return android;
//       case TargetPlatform.iOS:
//         return ios;
//       default:
//         throw UnsupportedError('Platform not supported');
//     }
//   }

//   static FirebaseOptions get web => FirebaseOptions(
//         apiKey: dotenv.env['FIREBASE_API_KEY']!,
//         authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN']!,
//         projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
//         storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
//         messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
//         appId: dotenv.env['FIREBASE_APP_ID']!,
//         measurementId: dotenv.env['FIREBASE_MEASUREMENT_ID']!,
//       );

//   static FirebaseOptions get android => FirebaseOptions(
//         apiKey: dotenv.env['FIREBASE_API_KEY']!,
//         appId: dotenv.env['FIREBASE_APP_ID']!,
//         messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
//         projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
//         storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
//       );

//   static FirebaseOptions get ios => FirebaseOptions(
//         apiKey: dotenv.env['FIREBASE_API_KEY']!,
//         appId: dotenv.env['FIREBASE_APP_ID']!,
//         messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
//         projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
//         storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
//         iosBundleId: dotenv.env['FIREBASE_IOS_BUNDLE_ID']!,
//       );
// }


// import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
// import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;
// import 'package:flutter_dotenv/flutter_dotenv.dart';

// class DefaultFirebaseOptions {
//   static Future<FirebaseOptions> get currentPlatform async {
//     if (!dotenv.isInitialized) {
//       await dotenv.load(fileName: ".env");
//     }

//     if (kIsWeb) {
//       return web;
//     }
//     switch (defaultTargetPlatform) {
//       case TargetPlatform.android:
//         return android;
//       case TargetPlatform.iOS:
//         return ios;
//       default:
//         throw UnsupportedError('This platform is not supported.');
//     }
//   }

//   static FirebaseOptions get web => FirebaseOptions(
//         apiKey: dotenv.env['FIREBASE_API_KEY']!,
//         authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN']!,
//         projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
//         storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
//         messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
//         appId: dotenv.env['FIREBASE_APP_ID']!,
//         measurementId: 'G-MEASUREMENT_ID',
//       );

//   static FirebaseOptions get android => FirebaseOptions(
//         apiKey: dotenv.env['FIREBASE_API_KEY']!,
//         appId: dotenv.env['FIREBASE_APP_ID']!,
//         messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
//         projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
//         storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
//       );

//   static FirebaseOptions get ios => FirebaseOptions(
//         apiKey: dotenv.env['FIREBASE_API_KEY']!,
//         appId: dotenv.env['FIREBASE_APP_ID']!,
//         messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
//         projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
//         storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
//         iosBundleId: 'com.example.lawtonic', // lowercase only
//       );
// }



import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DefaultFirebaseOptions {
  static Future<FirebaseOptions> get currentPlatform async {
    if (!dotenv.isInitialized) {
      await dotenv.load(fileName: ".env");
    }

    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError('This platform is not supported.');
    }
  }

  static FirebaseOptions get web => FirebaseOptions(
        apiKey: dotenv.env['FIREBASE_API_KEY']!,
        authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN']!,
        projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
        storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
        messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
        appId: dotenv.env['FIREBASE_APP_ID']!,
        measurementId: 'G-MEASUREMENT_ID',
      );

  static FirebaseOptions get android => FirebaseOptions(
        apiKey: dotenv.env['FIREBASE_API_KEY']!,
        appId: dotenv.env['FIREBASE_APP_ID']!,
        messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
        projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
        storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
      );

  static FirebaseOptions get ios => FirebaseOptions(
        apiKey: dotenv.env['FIREBASE_API_KEY']!,
        appId: dotenv.env['FIREBASE_APP_ID']!,
        messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
        projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
        storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET']!,
        iosBundleId: 'com.example.lawtonic', // lowercase only
      );
}
