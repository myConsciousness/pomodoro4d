// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library pomodoro4d;

abstract class Pomodoro {
  Stopwatch s = new Stopwatch();
  bool performs();

  void stop();

  void reset();

  int getStartMilliseconds();

  int getStartNanoseconds();

  int getMilliseconds();

  int getNanoseconds();

  int getSplitMilliseconds();

  int getSplitNanoseconds();
}
