import 'dart:async';

import 'package:flutter/material.dart';

class CountdownProvider extends ChangeNotifier {
  Duration duration = const Duration(seconds: 75);
  bool isRunning = false;

  StreamSubscription<int>? _tickSubscription;

  void startStopTimer() {
    if (!isRunning) {
      _startTimer(duration.inSeconds);
    } else {
      // Pausar el timer
      _tickSubscription?.pause();
    }

    isRunning = !isRunning;
    notifyListeners();
  }

  void _startTimer(int seconds) {
    _tickSubscription?.cancel();
    _tickSubscription = Stream<int>.periodic(
            const Duration(seconds: 1), (sec) => seconds - sec - 1)
        .take(seconds)
        .listen((timeLeftInSeconds) {
      duration = Duration(seconds: timeLeftInSeconds);
      notifyListeners();
    });
  }

  void setCountdownDuration(Duration newDuration) {
    duration = newDuration;
    _tickSubscription?.cancel();
    isRunning = false;
    notifyListeners();
  }

  String get timeLeftString {
    final minutes =
        ((duration.inSeconds / 60) % 60).floor().toString().padLeft(2, '0');
    final seconds =
        (duration.inSeconds % 60).floor().toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }
}
