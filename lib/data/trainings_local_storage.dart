import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod/riverpod.dart';
import 'package:triathlon_tracker/data/local_storage_constants.dart';
import 'package:triathlon_tracker/domain/training.dart';

class TrainingsLocalStorage {
  late Box<List<Training>> box;

  Future<void> init() async {
    box = await Hive.openBox(LocalStorageConstants.trainingsBox);
    if (box.isEmpty) {
      for (var element in TrainingType.values) {
        await box.put(element, <Training>[]);
      }
    }
  }

  Future<void> addTraining(TrainingType trainingType, Training training) async {
    final trainings = box.get(trainingType)!;
    trainings.add(training);
    box.put(trainingType, trainings);
  }

  List<Training> getTrainings(TrainingType trainingType) {
    return box.get(trainingType)!;
  }
}

final trainingsLocalStorageProvider = Provider<TrainingsLocalStorage>((ref) {
  return TrainingsLocalStorage();
});
