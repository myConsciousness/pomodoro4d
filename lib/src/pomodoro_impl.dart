// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:pomodoro4d/src/break_counter.dart';
import 'package:pomodoro4d/src/config/configuration.dart';
import 'package:pomodoro4d/src/pomodoro.dart';
import 'package:pomodoro4d/src/pomodoro_state.dart';

class PomodoroImpl implements Pomodoro {
  /// The configuration
  final Configuration _configuration;

  /// The stopwatch
  final Stopwatch _stopwatch = new Stopwatch();

  /// The break counter
  final BreakCounter _counter = BreakCounter.newInstance();

  /// The pomodoro state
  PomodoroState _pomodoroState = PomodoroState.INITIALIZED;

  /// Returns the new instance of [PomodoroImpl] based on the [configuration] passed as an argument.
  PomodoroImpl.from(Configuration configuration)
      : this._configuration = configuration;

  /// Returns the pomodoro state
  PomodoroState get pomodoroState => this._pomodoroState;

  @override
  bool performs() {
    if (this._pomodoroState == PomodoroState.INITIALIZED) {
      this._stopwatch.start();
      this._pomodoroState = PomodoroState.CONCENTRATING;
    }

    return this._pomodoroState != PomodoroState.INITIALIZED &&
        this._pomodoroState != PomodoroState.FINISHED;
  }

  @override
  void reset() {
    this._stopwatch.reset();
    this._counter.reset();
    this._pomodoroState = PomodoroState.INITIALIZED;
  }

  @override
  void stop() {
    this._stopwatch.stop();
    this._pomodoroState = PomodoroState.STOPPED;
  }

  @override
  bool shouldStartBreak() {
    return Duration(microseconds: this._stopwatch.elapsedMicroseconds)
            .inMinutes >=
        this._configuration.getConcentrationMinutes();
  }

  @override
  bool isBreaking() {
    return this._pomodoroState == PomodoroState.BREAKING ||
        this._pomodoroState == PomodoroState.LONGER_BREAKING;
  }

  @override
  bool shouldEndBreak() {
    if (this._pomodoroState == PomodoroState.LONGER_BREAKING) {
      return Duration(microseconds: this._stopwatch.elapsedMicroseconds)
              .inMinutes >=
          this._configuration.getLongerBreakMinutes();
    }

    return Duration(microseconds: this._stopwatch.elapsedMicroseconds)
            .inMinutes >=
        this._configuration.getBreakMinutes();
  }

  @override
  void startBreak() {
    if (this._counter.count >= this._configuration.getCountUntilLongerBreak()) {
      this._counter.increment();
      this._pomodoroState = PomodoroState.LONGER_BREAKING;
    } else {
      this._counter.increment();
      this._pomodoroState = PomodoroState.BREAKING;
    }

    this._restartStopwatch();
  }

  @override
  void endBreak() {
    if (this._pomodoroState == PomodoroState.LONGER_BREAKING) {
      this._counter.reset();
      this._pomodoroState = PomodoroState.FINISHED;
    } else {
      this._pomodoroState = PomodoroState.CONCENTRATING;
    }

    this._restartStopwatch();
  }

  @override
  void startBreakIfShould() {
    if (this.shouldStartBreak()) {
      this.startBreak();
    }
  }

  @override
  void endBreakIfShould() {
    if (this.shouldEndBreak()) {
      this.endBreak();
    }
  }

  /// Restarts the stopwatch
  void _restartStopwatch() {
    this._stopwatch.reset();
    this._stopwatch.start();
  }
}
