// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:pomodoro4d/src/break_support.dart';

abstract class Pomodoro extends BreakSupport {
  bool performs();

  void stop();

  void reset();
}