import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:simon_2/app.dart';

void main() {
  // Set `enableInDevMode` to true to see reports while in debug mode.
  //Crashlytics.instance.enableInDevMode = true;

  // Pass all uncaught errors to Crashlytics.
  FlutterError.onError = (FlutterErrorDetails details) {
    Crashlytics.instance.onError(details);
  };

  // Force crash.
  //Crashlytics.instance.crash();

  runApp(Simon2App());
}
