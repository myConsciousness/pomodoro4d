[![Dart](https://github.com/myConsciousness/pomodoro4d/actions/workflows/dart.yml/badge.svg?branch=main)](https://github.com/myConsciousness/pomodoro4d/actions/workflows/dart.yml)

# 1. Pomodoro4D

## 1.1. What is it?

`Pomodoro4D` is a Pomodoro Technique binding library for the Dart language licensed under BSD 3-Clause.

<!-- TOC -->

- [1. Pomodoro4D](#1-pomodoro4d)
  - [1.1. What is it?](#11-what-is-it)
  - [1.2. Motivation](#12-motivation)
  - [1.3. How To Use](#13-how-to-use)
    - [1.3.1. Create Pomodoro instance with configuration](#131-create-pomodoro-instance-with-configuration)
    - [1.3.2. Start Pomodoro cycle](#132-start-pomodoro-cycle)
  - [1.4. License](#14-license)
  - [1.5. More Information](#15-more-information)

<!-- /TOC -->

## 1.2. Motivation

1. Provide a tested, simple, and easy-to-use implementation of the Pomodoro Technique.
2. To standardize the implementation of the Pomodoro Technique in programming.
3. Provide intuitive manipulation of the Pomodoro Technique in programming.
4. Pray that the people of the world can work more productively.

## 1.3. How To Use

Pomodoro4D is a rigorously interpreted program of Pomodoro Technique procedures and methods.</br>
Therefore, users of Pomodoro4D can reproduce the real Pomodoro Technique without being aware of how to use or implement each method by following the instructions below.

### 1.3.1. Create Pomodoro instance with configuration

Basically, you can create a new Pomodoro instance in the following format.

```dart
class DemoPomodoro {

    void main() {
        // Set the simple configuration of Pomodoro cycle
        final Configuration configuration = Configuration()
                                                .setConcentrationMinutes(25)
                                                .setBreakMinutes(5)
                                                .setLongerBreakMinutes(15)
                                                .setCountUntilLongerBreak(4);

        final Pomodoro pomodoro = Pomodoro(configuration);
    }
}
```

For the configuration builder object in the above example, specify arbitrary values for the following property fields.</br>
The initial values of each property are specified by referring to the Pomodoro Technique implementation method [here](https://en.wikipedia.org/wiki/Pomodoro_Technique).

| Property                      | Initial Value | Unit    | Description                                                                                                                                                                      |
| ----------------------------- | ------------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| setConcentrationMinutes(int)  | 25            | Minutes | A property representing the concentration time in the Pomodoro Technique. The unit is minutes and an integer can be specified. The default value is specified as 25 (minutes).   |
| setBreakMinutes(int)          | 5             | Minutes | A property representing the break time in the Pomodoro Technique. The unit is minutes and an integer can be specified. The default value is specified as 5 (minutes).            |
| setLongerBreakMinutes(int)    | 15            | Minutes | A property representing the longer break time in the Pomodoro Technique. The unit is minutes and an integer can be specified. The default value is specified as 15 (minutes).    |
| setCountUntilLongerBreak(int) | 4             | Counts  | A property representing the count until longer break in the Pomodoro Technique. The unit is count and an integer can be specified. The default value is specified as 4 (counts). |

### 1.3.2. Start Pomodoro cycle

```dart
class DemoPomodoro {

    void main() {

        // Set the simple configuration of Pomodoro cycle
        final Configuration configuration = Configuration()
                                                .setConcentrationMinutes(25)
                                                .setBreakMinutes(5)
                                                .setLongerBreakMinutes(15)
                                                .setCountUntilLongerBreak(4);

        final Pomodoro pomodoro = Pomodoro(configuration);

        // The entire Pomodoro cycle is performed in this while clause.
        // With the above property value setting,
        // concentration and rest will be performed four times, with a longer rest at the end.
        while (pomodoro.performs()) {

            // When the above property value of 25 minutes has elapsed, the break time begins.
            if (pomodoro.shouldStartBreak()) {
                // Break and long break are determined by internal processing, so just call startBreak().
                pomodoro.startBreak();

                // All cycles during the break will be performed in this while clause.
                while (pomodoro.isBreaking()) {

                    // When the above property value of 5 (normal break) or 15 (longer break) minutes has elapsed, the break time ends.
                    if (pomodoro.shouldEndBreak()) {
                        // If it is a long break,
                        // it means that the entire Pomodoro cycle is complete at this point.
                        pomodoro.endBreak();
                    }
                }
            }
        }
    }
}
```

## 1.4. License

```license
Copyright (c) 2021, Kato Shinya. All rights reserved.
Use of this source code is governed by a
BSD-style license that can be found in the LICENSE file.
```

## 1.5. More Information

`Pomodoro4D` was designed and implemented by Kato Shinya, who works as a freelance developer.

Regardless of the means or content of communication, I would love to hear from you if you have any questions or concerns. I do not check my email box very often so a response may be delayed, anyway thank you for your interest!

- [Creator Profile](https://github.com/myConsciousness)
- [Creator Website](https://myconsciousness.github.io)
- [License](https://github.com/myConsciousness/pomodoro4d/blob/main/LICENSE)
- [Release Note](https://github.com/myConsciousness/pomodoro4d/releases)
- [File a Bug](https://github.com/myConsciousness/pomodoro4d/issues)
