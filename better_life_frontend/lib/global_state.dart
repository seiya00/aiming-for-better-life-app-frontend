import 'package:flutter/material.dart';
import 'dart:async';

class GlobalState with ChangeNotifier {
  bool _isFinishedMealQuestion = false;
  bool _isFinishedSleepQuestion = false;
  bool _isFinishedExerciseQuestion = false;
  DateTime currentDate = DateTime.now();

  GlobalState() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      checkDateChanged();
    });
  }

  bool get isFinishedMealQuestion => _isFinishedMealQuestion;
  bool get isFinishedSleepQuestion => _isFinishedSleepQuestion;
  bool get isFinishedExerciseQuestion => _isFinishedExerciseQuestion;

  void setIsFinishedMealQuestion(bool newValue) {
    _isFinishedMealQuestion = newValue;
    notifyListeners();
  }

  void setIsFinishedSleepQuestion(bool newValue) {
    _isFinishedSleepQuestion = newValue;
    notifyListeners();
  }

  void setIsFinishedExerciseQuestion(bool newValue) {
    _isFinishedExerciseQuestion = newValue;
    notifyListeners();
  }

  void checkDateChanged() {
    DateTime now = DateTime.now();
    if (now.day != currentDate.day) {
      setIsFinishedMealQuestion(false);
      setIsFinishedSleepQuestion(false);
      setIsFinishedExerciseQuestion(false);
      currentDate = now;
    }
  }
}