// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// The class that represents break of Pomodoro.
abstract class BreakSupport {
  /// Checkes if a break should be started.
  bool shouldStartBreak();

  ///  Checkes if a break is ongoing.
  bool isBreaking();

  ///  Checkes if a break should be ended.
  bool shouldEndBreak();

  ///  Starts the break.
  void startBreak();

  ///  Ends the break.
  void endBreak();

  ///  Starts the break if should start.
  void startBreakIfShould();

  /// Ends the break if should end.
  void endBreakIfShould();
}
