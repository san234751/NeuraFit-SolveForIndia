import 'dart:async';
import 'dart:math' as Math;
import 'package:app/pages/pushed_page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class YogaCameraPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  final String? title;
  const YogaCameraPage({Key? key, required this.cameras, required this.title})
      : super(key: key);
  @override
  State<YogaCameraPage> createState() => _YogaCameraPageState();
}

class _YogaCameraPageState extends State<YogaCameraPage> {
  bool ispause = false;
  bool hasStarted = false;
  int sec = 0;
  int min = 0, reps = 0;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 10;
  Timer? timer;

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    if (hasStarted) {
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (!ispause) sec++;
          if (sec == 60) {
            min++;
            sec = 0;
          }
        });
      });
    }
  }

  setreps(value) {
    setState(() {
      reps = value;
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: devicesize.width,
              height: devicesize.height * 0.8,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              clipBehavior: Clip.hardEdge,
              child: hasStarted
                  ? PushedPage(
                      cameras: widget.cameras,
                      title: widget.title!,
                      callback: setreps)
                  : Center(
                      child: CountdownTimer(
                        endTime: endTime,
                        onEnd: () {
                          setState(() {
                            hasStarted = true;
                          });
                          _incrementCounter();
                        },
                        widgetBuilder: (_, CurrentRemainingTime? time) {
                          if (time == null) {
                            return const Text(
                              'Completed',
                              style: TextStyle(fontSize: 22),
                            );
                          }
                          return Text(
                            '${time.sec ?? 0}',
                            style: const TextStyle(
                                fontSize: 45, color: Colors.white),
                          );
                        },
                      ),
                    ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                width: devicesize.width * 0.2,
                height: devicesize.width * 0.2,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 224, 180, 1),
                    borderRadius: BorderRadius.circular(10)),
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  widget.title == 'Yoga'
                      ? Text(
                          min.toString(),
                          style: const TextStyle(fontSize: 40),
                        )
                      : Text('${(reps / 15).floor()}',
                          style: const TextStyle(
                            fontSize: 40,
                          )),
                  widget.title != 'Yoga' ? const Text('sets') : Text('min'),
                  const SizedBox(
                    height: 4,
                  )
                ]),
              ),
              Container(
                width: devicesize.width * 0.2,
                height: devicesize.width * 0.2,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 224, 180, 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    widget.title == 'Yoga'
                        ? Text(
                            sec.toString(),
                            style: const TextStyle(fontSize: 40),
                          )
                        : Text('${reps}', style: const TextStyle(fontSize: 40)),
                    widget.title != 'Yoga' ? const Text('reps') : Text('secs'),
                    SizedBox(height: 4)
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  timer?.cancel();
                  if (widget.title == 'Yoga') {
                    Navigator.of(context).pop([widget.title, min * 60 + sec]);
                  } else {
                    Navigator.of(context).pop([widget.title, reps]);
                  }
                },
                child: Container(
                  width: devicesize.width * 0.2,
                  height: devicesize.width * 0.2,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 94, 88, 1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Container(
                      width: devicesize.width * 0.07,
                      height: devicesize.width * 0.07,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    ispause = !ispause;
                  });
                  if (ispause) {
                    endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 10;
                  } else {
                    endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 10;
                  }
                },
                child: Container(
                  width: devicesize.width * 0.2,
                  height: devicesize.width * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromRGBO(71, 71, 71, 1),
                      width: 2,
                    ),
                  ),
                  child: Center(
                      child: Icon(
                    ispause ? Icons.play_arrow_rounded : Icons.pause,
                    size: 28,
                  )),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
