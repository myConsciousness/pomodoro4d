// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:pomodoro4d/src/config/configuration.dart';

/// This class represents a factory that creates instances of objects
/// that represent the configuration of Pomodoro.
abstract class ConfigurationFactory {
  /// Returns the instance of configuration.
  Configuration getInstance();
}
