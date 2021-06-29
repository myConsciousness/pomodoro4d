// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:pomodoro4d/src/config/basic_configuration.dart';

/// The class that represents the configuration that Pomodoro refers to at runtime.
abstract class Configuration {
  factory Configuration() => BasicConfiguration.newInstance();

  /// Sets the [concentrationMinutes] and returns this instance.
  Configuration setConcentrationMinutes(int concentrationMinutes);

  /// Sets the [breakMinutes] and returns this instance.
  Configuration setBreakMinutes(int breakMinutes);

  /// Sets the [longerBreakMinutes] and returns this instance.
  Configuration setLongerBreakMinutes(int longerBreakMinutes);

  /// Sets the [countUntilLongerBreak] and returns this instance.
  Configuration setCountUntilLongerBreak(int countUntilLongerBreak);

  /// Returns the concentration minutes.
  int getConcentrationMinutes();

  /// Returns the break minutes.
  int getBreakMinutes();

  /// Returns the longer break minutes.
  int getLongerBreakMinutes();

  /// Returns the count until longer break.
  int getCountUntilLongerBreak();
}
