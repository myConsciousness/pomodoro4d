// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:pomodoro4d/pomodoro4d.dart';

/// The class that demonstrates the [Pomodoro].
class DemoPomodoro {
  /// Starts the demonstrates.
  void main() {
    final Pomodoro pomodoro = Pomodoro(Configuration()
        .setConcentrationMinutes(25)
        .setBreakMinutes(5)
        .setLongerBreakMinutes(15)
        .setCountUntilLongerBreak(4));

    while (pomodoro.performs()) {
      if (pomodoro.shouldStartBreak()) {
        pomodoro.startBreak();

        while (pomodoro.isBreaking()) {
          if (pomodoro.shouldEndBreak()) {
            pomodoro.endBreak();
          }
        }
      }
    }
  }
}
