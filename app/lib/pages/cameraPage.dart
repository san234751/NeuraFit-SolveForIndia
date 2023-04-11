import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);
  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
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
              height: devicesize.height * 0.85,
              color: Colors.black,
            ),
            Row(children: [Container(),Container(),Container(),Container()])
          ],
        ),
      ),
    );
  }
}
