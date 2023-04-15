import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_button/sign_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: double.infinity),
            Container(
              height: 160,
              width: 160,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo.jpg'),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 60),
            SignInButton(
              buttonType: ButtonType.google,
              buttonSize: ButtonSize.large,
              onPressed: () async {
                FirebaseAuth auth = FirebaseAuth.instance;
                final GoogleSignIn googleSignIn = GoogleSignIn();

                final GoogleSignInAccount? googleSignInAccount =
                    await googleSignIn.signIn();

                if (googleSignInAccount != null) {
                  final GoogleSignInAuthentication googleSignInAuthentication =
                      await googleSignInAccount.authentication;

                  final AuthCredential credential =
                      GoogleAuthProvider.credential(
                    accessToken: googleSignInAuthentication.accessToken,
                    idToken: googleSignInAuthentication.idToken,
                  );

                  try {
                    await auth.signInWithCredential(credential);
                  } on FirebaseAuthException catch (e) {
                    SnackBar(
                      content: Text(e.message!),
                      backgroundColor: Colors.redAccent,
                    );
                  }
                } else {
                  const SnackBar(
                    content: Text('No Google Account Selected'),
                    backgroundColor: Colors.redAccent,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
