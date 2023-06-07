import 'package:flutter/material.dart';
import 'circular_progressbar_with_animation_widget.dart';

class CircularProgressBar extends StatefulWidget {
  const CircularProgressBar({super.key});

  @override
  State<CircularProgressBar> createState() => _CircularProgressBarState();
}

class _CircularProgressBarState extends State<CircularProgressBar> {
  double _to = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
              width: 200,
              height: 200,
              child: CircularProgressbarWithAnimation()),
        ],
      ),
    );
  }
}
