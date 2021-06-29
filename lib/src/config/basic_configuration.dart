// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:pomodoro4d/src/config/configuration.dart';

/// The class that represents the basic configuration that Pomodoro refers to at runtime.
///
/// If you want to dynamically change the configuration of the Pomodoro runtime,
/// use the Setter functions defined in this [BasicConfiguration] class and set an specific value.
///
/// The configuration at the time of instance creation of this class is set with the following values.
///
/// ### Initial configuration
/// | Property                      | Initial Value | Unit    |
/// | ----------------------------- | ------------- | ------- |
/// | concentrationMinutes      | 25                | Minutes |
/// | breakMinutes             | 5                 | Minutes |
/// | longerBreakMinutes       | 15                | Minutes |
/// | countUntilLongerBreak    | 4                 | Counts  |
class BasicConfiguration implements Configuration {
  /// Returns the new instance of [BasicConfiguration].
  BasicConfiguration.newInstance();

  /// The concentration minutes
  int _concentrationMinutes = 25;

  /// The break minutes
  int _breakMinutes = 5;

  /// The longer break minutes
  int _longerBreakMinutes = 15;

  /// The count until longer break
  int _countUntilLongerBreak = 4;

  @override
  int getBreakMinutes() => this._breakMinutes;

  @override
  int getConcentrationMinutes() => this._concentrationMinutes;

  @override
  int getCountUntilLongerBreak() => this._countUntilLongerBreak;

  @override
  int getLongerBreakMinutes() => this._longerBreakMinutes;

  @override
  Configuration setBreakMinutes(int breakMinutes) {
    this._breakMinutes = breakMinutes;
    return this;
  }

  @override
  Configuration setConcentrationMinutes(int concentrationMinutes) {
    this._concentrationMinutes = concentrationMinutes;
    return this;
  }

  @override
  Configuration setCountUntilLongerBreak(int countUntilLongerBreak) {
    this._countUntilLongerBreak = countUntilLongerBreak;
    return this;
  }

  @override
  Configuration setLongerBreakMinutes(int longerBreakMinutes) {
    this._longerBreakMinutes = longerBreakMinutes;
    return this;
  }
}
