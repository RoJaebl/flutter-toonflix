import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const tewntyFiveMinutes = 1500;
  int totalSeconds = tewntyFiveMinutes;
  int totalPomodoros = 0;
  late Timer timer;
  bool inProgress = false;

  void onTick() {
    timer = Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) => setState(() {
              if (totalSeconds == 0) {
                totalPomodoros += 1;
                totalSeconds = tewntyFiveMinutes;
                timer.cancel();
                inProgress = false;
              } else {
                totalSeconds -= 1;
              }
            }));
  }

  void onChangeProgress() => setState(() {
        inProgress ? timer.cancel() : onTick();
        inProgress = !inProgress;
      });

  String format(int seconds) {
    return Duration(seconds: seconds)
        .toString()
        .split('.')
        .first
        .substring(2, 7);
  }

  void onClickTimerReset() => setState(() {
        totalSeconds = tewntyFiveMinutes;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 89,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 120,
                  color: Theme.of(context).cardColor,
                  onPressed: onChangeProgress,
                  icon: Icon(
                    inProgress
                        ? Icons.pause_circle_filled_rounded
                        : Icons.play_circle_outline_rounded,
                  ),
                ),
                IconButton(
                  iconSize: 60,
                  color: Theme.of(context).cardColor,
                  onPressed: inProgress ? null : onClickTimerReset,
                  icon: const Icon(
                    Icons.restore_rounded,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(50)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pomodors',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                        Text(
                          '$totalPomodoros',
                          style: TextStyle(
                            fontSize: 58,
                            fontWeight: FontWeight.w600,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
