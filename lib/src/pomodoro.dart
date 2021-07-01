// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:pomodoro4d/src/break_support.dart';
import 'package:pomodoro4d/src/config/configuration.dart';
import 'package:pomodoro4d/src/pomodoro_impl.dart';

/// The class that represents the Pomodoro.
///
/// You can easily create a Pomodoro set by implementing the following.
///
/// ```dart
/// final Pomodoro pomodoro = Pomodoro(Configuration()
///           .setConcentrationMinutes(20)
///           .setBreakMinutes(5)
///           .setLongerBreakMinutes(15)
///           .setCountUntilLongerBreak(4));
///
/// while (pomodoro.performs()) {
///   if (pomodoro.shouldStartBreak()) {
///     pomodoro.startBreak();
///
///     while (pomodoro.isBreaking()) {
///       if (pomodoro.shouldEndBreak()) {
///          pomodoro.endBreak();
///       }
///     }
///   }
/// }
/// ```
abstract class Pomodoro extends BreakSupport {
  /// The factory constructor.
  factory Pomodoro(Configuration configuration) =>
      PomodoroImpl.from(configuration);

  /// Starts a pomodoro set and returns [true] as long as this pomodoro set is ongoing.
  bool performs();

  /// Stops the pomodoro.
  void stop();

  /// Resets the pomodoro.
  void reset();
}
