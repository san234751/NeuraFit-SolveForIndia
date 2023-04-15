import 'dart:ui';

import 'package:flutter/material.dart';

class PendingCard extends StatelessWidget {
  String title;
  IconData logo;
  Size devicesize;
  Function callback;
  PendingCard(
      {Key? key,
      required this.title,
      required this.logo,
      required this.devicesize,
      required this.callback})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: devicesize.width * 0.9,
      height: devicesize.height / 5,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 224, 180, 1),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(),
                ),
                child: TextButton.icon(
                  icon: const Icon(Icons.play_arrow, color: Colors.black),
                  onPressed: () {
                    //pass data in arguments
                    Navigator.of(context)
                        .pushNamed('/camerapage', arguments: title)
                        .then((value) => callback(title));
                    // Navigator.of(context).pushNamed('/camerapage');
                  },
                  label: const Text(
                    "Start",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Icon(logo, size: 80),
        ],
      ),
    );
  }
}
