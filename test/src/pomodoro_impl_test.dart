// Copyright (c) 2021, Kato Shinya. All rights reserved.
// Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro4d/src/config/configuration.dart';
import 'package:pomodoro4d/src/pomodoro_impl.dart';
import 'package:pomodoro4d/src/pomodoro_state.dart';

/// The test class for [PomodoroImpl].
void main() {
  group('Tests performs()', () {
    test('Tests execute performs', () {
      final PomodoroImpl pomodoro = PomodoroImpl.from(Configuration());

      expect(pomodoro.state, PomodoroState.INITIALIZED);
      pomodoro.performs();
      expect(pomodoro.state, PomodoroState.CONCENTRATING);
    });
  });

  group('Tests stop()', () {
    test('Tests execute stop', () {
      final PomodoroImpl pomodoro = PomodoroImpl.from(Configuration());

      expect(pomodoro.state, PomodoroState.INITIALIZED);
      pomodoro.performs();
      expect(pomodoro.state, PomodoroState.CONCENTRATING);
      pomodoro.stop();
      expect(pomodoro.state, PomodoroState.STOPPED);
    });
  });

  group('Tests reset()', () {
    test('Tests execute reset', () {
      final PomodoroImpl pomodoro = PomodoroImpl.from(Configuration());

      expect(pomodoro.state, PomodoroState.INITIALIZED);
      pomodoro.performs();
      expect(pomodoro.state, PomodoroState.CONCENTRATING);
      pomodoro.reset();
      expect(pomodoro.state, PomodoroState.INITIALIZED);
    });
  });

  group('Tests shouldStartBreak()', () {
    test('Test when should start break', () async {
      final PomodoroImpl pomodoro =
          PomodoroImpl.from(Configuration().setConcentrationMinutes(1));

      pomodoro.performs();
      await new Future.delayed(new Duration(minutes: 1));
      expect(pomodoro.shouldStartBreak(), true);
    }, timeout: Timeout(Duration(minutes: 2)));

    test('Test when should not start break', () {
      final PomodoroImpl pomodoro =
          PomodoroImpl.from(Configuration().setConcentrationMinutes(1));

      pomodoro.performs();
      expect(pomodoro.shouldStartBreak(), false);
    });
  });

  group('Tests isBreaking()', () {
    test('Test when break is ongoing', () async {
      final PomodoroImpl pomodoro =
          PomodoroImpl.from(Configuration().setConcentrationMinutes(1));

      pomodoro.performs();
      await new Future.delayed(new Duration(minutes: 1));
      expect(pomodoro.shouldStartBreak(), true);

      pomodoro.startBreak();
      expect(pomodoro.state, PomodoroState.BREAKING);
      expect(pomodoro.isBreaking(), true);
    }, timeout: Timeout(Duration(minutes: 2)));

    test('Test when break is not ongoing', () {
      final PomodoroImpl pomodoro =
          PomodoroImpl.from(Configuration().setConcentrationMinutes(1));

      pomodoro.performs();
      expect(pomodoro.isBreaking(), false);
    });

    test('Test when longer break is ongoing', () async {
      final PomodoroImpl pomodoro = PomodoroImpl.from(Configuration()
          .setConcentrationMinutes(1)
          .setLongerBreakMinutes(1)
          .setCountUntilLongerBreak(0));

      pomodoro.performs();
      await new Future.delayed(new Duration(minutes: 1));
      expect(pomodoro.shouldStartBreak(), true);

      pomodoro.startBreak();
      expect(pomodoro.state, PomodoroState.LONGER_BREAKING);
      expect(pomodoro.isBreaking(), true);
    }, timeout: Timeout(Duration(minutes: 2)));

    test('Test when longer break is not ongoing', () {
      final PomodoroImpl pomodoro = PomodoroImpl.from(Configuration()
          .setConcentrationMinutes(1)
          .setLongerBreakMinutes(1)
          .setCountUntilLongerBreak(0));

      pomodoro.performs();
      expect(pomodoro.isBreaking(), false);
    });
  });

  group('Tests shouldEndBreak()', () {
    test('Test when should end break', () async {
      final PomodoroImpl pomodoro =
          PomodoroImpl.from(Configuration().setBreakMinutes(1));

      pomodoro.performs();
      await new Future.delayed(new Duration(minutes: 1));
      expect(pomodoro.shouldEndBreak(), true);
    }, timeout: Timeout(Duration(minutes: 2)));

    test('Test when should not end break', () {
      final PomodoroImpl pomodoro =
          PomodoroImpl.from(Configuration().setConcentrationMinutes(1));

      pomodoro.performs();
      expect(pomodoro.shouldEndBreak(), false);
    });

    test('Test when should end longer break', () async {
      final PomodoroImpl pomodoro = PomodoroImpl.from(
          Configuration().setLongerBreakMinutes(1).setCountUntilLongerBreak(0));

      pomodoro.performs();
      pomodoro.startBreak();
      expect(pomodoro.state, PomodoroState.LONGER_BREAKING);
      await new Future.delayed(new Duration(minutes: 1));
      expect(pomodoro.shouldEndBreak(), true);
    }, timeout: Timeout(Duration(minutes: 2)));

    test('Test when should not end longer break', () {
      final PomodoroImpl pomodoro = PomodoroImpl.from(
          Configuration().setLongerBreakMinutes(1).setCountUntilLongerBreak(0));

      pomodoro.performs();
      pomodoro.startBreak();
      expect(pomodoro.state, PomodoroState.LONGER_BREAKING);
      expect(pomodoro.shouldEndBreak(), false);
    });
  });

  group('Tests startBreak()', () {
    test('Test start break', () {
      final PomodoroImpl pomodoro =
          PomodoroImpl.from(Configuration().setCountUntilLongerBreak(1));

      pomodoro.performs();
      pomodoro.startBreak();
      expect(pomodoro.state, PomodoroState.BREAKING);
    });

    test('Test start longer break', () {
      final PomodoroImpl pomodoro =
          PomodoroImpl.from(Configuration().setCountUntilLongerBreak(0));

      pomodoro.performs();
      pomodoro.startBreak();
      expect(pomodoro.state, PomodoroState.LONGER_BREAKING);
    });
  });

  group('Test endBreak()', () {
    test('Tests end break', () {
      final PomodoroImpl pomodoro =
          PomodoroImpl.from(Configuration().setCountUntilLongerBreak(1));

      pomodoro.performs();
      pomodoro.startBreak();
      expect(pomodoro.state, PomodoroState.BREAKING);
      pomodoro.endBreak();
      expect(pomodoro.state, PomodoroState.CONCENTRATING);
    });

    test('Tests end longer break', () {
      final PomodoroImpl pomodoro =
          PomodoroImpl.from(Configuration().setCountUntilLongerBreak(0));

      pomodoro.performs();
      pomodoro.startBreak();
      expect(pomodoro.state, PomodoroState.LONGER_BREAKING);
      pomodoro.endBreak();
      expect(pomodoro.state, PomodoroState.FINISHED);
    });
  });

  group('Integration Test', () {
    test('Tests simple integration pattern', () async {
      final PomodoroImpl pomodoro = PomodoroImpl.from(Configuration()
          .setConcentrationMinutes(1)
          .setBreakMinutes(1)
          .setLongerBreakMinutes(2)
          .setCountUntilLongerBreak(3));

      int breakCount = 0;
      while (pomodoro.performs()) {
        expect(pomodoro.state, PomodoroState.CONCENTRATING);

        if (pomodoro.shouldStartBreak()) {
          breakCount++;
          pomodoro.startBreak();

          expect(
              pomodoro.state,
              breakCount > 3
                  ? PomodoroState.LONGER_BREAKING
                  : PomodoroState.BREAKING);

          while (pomodoro.isBreaking()) {
            if (pomodoro.shouldEndBreak()) {
              pomodoro.endBreak();
              expect(
                  pomodoro.state,
                  breakCount > 3
                      ? PomodoroState.FINISHED
                      : PomodoroState.CONCENTRATING);
            }
          }
        }
      }

      expect(pomodoro.state, PomodoroState.FINISHED);
    }, timeout: Timeout(Duration(minutes: 13)));
  });
}
