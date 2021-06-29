// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// The enum that represents the state of Pomodoro.
enum PomodoroState {
  /// The initialized
  INITIALIZED,

  /// The concentrating
  CONCENTRATING,

  /// The breaking
  BREAKING,

  /// The longer breaking
  LONGER_BREAKING,

  /// The stopped
  STOPPED,

  /// The finished
  FINISHED
}
