import 'package:app/services/render_data_plank.dart';
import 'package:app/services/render_data_squat.dart';
import 'package:app/services/render_data_yoga.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math';

import 'package:app/services/camera.dart';
import 'package:app/services/render_data_arm_press.dart';

class PushedYogaPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  final String title;
  Function callback;
  PushedYogaPage({
    Key? key,
    required this.cameras,
    required this.title,
    required this.callback,
  }) : super(key: key);
  @override
  _PushedYogaPageState createState() => _PushedYogaPageState();
}

class _PushedYogaPageState extends State<PushedYogaPage> {
  List<dynamic>? _data;
  int _imageHeight = 0;
  int _imageWidth = 0;
  int x = 1, reps = 0;

  @override
  void initState() {
    super.initState();
    var res = loadModel();
    print('Model Response: ' + res.toString());
  }

  _setRecognitions(data, imageHeight, imageWidth) {
    if (!mounted) {
      return;
    }
    setState(() {
      _data = data;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  getreps(value) {
    widget.callback(value);
  }

  loadModel() async {
    return await Tflite.loadModel(
        model: "assets/posenet_mv1_075_float_from_checkpoints.tflite");
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Camera(
          cameras: widget.cameras,
          setRecognitions: _setRecognitions,
        ),
        RenderDataYoga(
          data: _data ?? [],
          previewH: max(_imageHeight, _imageWidth),
          previewW: min(_imageHeight, _imageWidth),
          screenH: screen.height,
          screenW: screen.width,
        )
      ],
    );
  }
}
