import 'package:app/pages/camera_page.dart';
import 'package:app/pages/homepage.dart';
import 'package:app/pages/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> _cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return MaterialApp(
      title: 'Vital',
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapShot) {
          if (userSnapShot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo.jpg'),
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              backgroundColor: Colors.orangeAccent,
            );
          }
          if (userSnapShot.hasData) {
            return HomePage();
          }
          return HomePage();
        },
      ),
      routes: {
        '/camerapage': (context) => CameraPage(
              cameras: _cameras,
              title: ModalRoute.of(context)!.settings.arguments as String,
            )
      },
    );
  }
}
