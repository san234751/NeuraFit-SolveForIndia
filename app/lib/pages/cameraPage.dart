import 'package:app/main.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);
  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final cameraController = controller;
  bool ispause = false;
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
              height: devicesize.height * 0.80,
              // color: Colors.black,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60))),
              clipBehavior: Clip.hardEdge,
              child: const CameraWidget(),
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
                  Text('sets'),
                  SizedBox(
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
                        Text('reps'),
                        SizedBox(
                          height: 4,
                        )
                      ])),
              InkWell(
                onTap: () {
                  // Navigator.of(context).pop();
                  cameraController!.stopVideoRecording();
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
                  if (ispause)
                    controller!.resumeVideoRecording();
                  else
                    controller!.pauseVideoRecording();
                  setState(() {
                    ispause = !ispause;
                  });
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
