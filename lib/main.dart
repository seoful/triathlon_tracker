import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:triathlon_tracker/app.dart';
import 'package:triathlon_tracker/error_handler.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      await Hive.initFlutter();
      final container = ProviderContainer();
      runApp(
        UncontrolledProviderScope(
          container: container,
          child: const App(),
        ),
      );
    },
    ErrorHandler.recordError,
  );
}
