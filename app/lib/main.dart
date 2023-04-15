import 'package:app/pages/camera_page.dart';
import 'package:app/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> _cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vital',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/camerapage': (context) => CameraPage(
              cameras: _cameras,
              title: ModalRoute.of(context)!.settings.arguments as String,
            )
      },
    );
  }
}
