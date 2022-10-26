import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:triathlon_tracker/app.dart';
import 'package:triathlon_tracker/core/error_handler.dart';
import 'package:triathlon_tracker/data/goals_local_storage.dart';
import 'package:triathlon_tracker/data/profile_local_storage.dart';
import 'package:triathlon_tracker/data/trainings_local_storage.dart';
import 'package:triathlon_tracker/domain/goals.dart';
import 'package:triathlon_tracker/domain/training.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      final container = ProviderContainer();
      await initHive(container);
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

Future<void> initHive(ProviderContainer container) async {
  await Hive.initFlutter();
  Hive.registerAdapter(GoalsAdapter());
  Hive.registerAdapter(TrainingAdapter());
  Hive.registerAdapter(TrainingTypeAdapter());
  await container.read(profileLocalStorageProvider).init();
  await container.read(goalsLocalStorageProvider).init();
  await container.read(trainingsLocalStorageProvider).init();
}
