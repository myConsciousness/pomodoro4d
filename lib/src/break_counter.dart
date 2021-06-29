// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// The class that represents the conter of break.
class BreakCounter {
  /// The count
  int _count = 0;

  /// The constructor.
  BreakCounter.newInstance();

  /// Returns the count.
  int get count => this._count;

  /// Increments the counter and returns this instance.
  BreakCounter increment() {
    this._count++;
    return this;
  }

  /// Decrements the counter and returns this instance.
  BreakCounter decrement() {
    this._count--;
    return this;
  }

  /// Resets the counter and returns this instance.
  BreakCounter reset() {
    this._count = 0;
    return this;
  }
}
