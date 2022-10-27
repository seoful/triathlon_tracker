// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:triathlon_tracker/domain/training.dart';

part 'trainings_state.freezed.dart';
part 'trainings_state.g.dart';

@freezed
class TrainingsState with _$TrainingsState {
  factory TrainingsState({
    required List<Training> swimming,
    required List<Training> cycling,
    required List<Training> running,
  }) = _TrainingsState;

  factory TrainingsState.fromJson(Map<String, dynamic> json) => _$TrainingsStateFromJson(json);
}