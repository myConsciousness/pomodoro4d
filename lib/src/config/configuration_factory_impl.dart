// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:pomodoro4d/src/config/basic_configuration.dart';
import 'package:pomodoro4d/src/config/configuration.dart';
import 'package:pomodoro4d/src/config/configuration_factory.dart';

/// The factory class that implements the [ConfigurationFactory].
class ConfigurationFactoryImpl extends ConfigurationFactory {
  @override
  Configuration getInstance() {
    return BasicConfiguration.newInstance();
  }
}
