import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'circular_progressbar_with_animation_widget.dart';
import 'line_progressbar_animation.dart';
import 'dart:math' as math;

class CircularProgressBar extends StatefulWidget {
  const CircularProgressBar({super.key});

  @override
  State<CircularProgressBar> createState() => _CircularProgressBarState();
}

class _CircularProgressBarState extends State<CircularProgressBar> {
  double _to = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 200,
              height: 200,
              child: CircularProgressbarWithAnimation(
                duration: const Duration(seconds: 2),
                symbol: '%',
                from: 0,
                to: _to,
                innerStrokeColor: Colors.purpleAccent,
                strokeColor: Colors.grey.shade300,
                innerStrokeWidth: 15,
                strokeWidth: 5,
                colorConditions: [
                  ColorRule(
                    color: Colors.redAccent,
                    rangeIndex: [21, 40],
                  ),
                  ColorRule(
                    color: Colors.grey.shade400,
                    rangeIndex: [0, 20],
                  ),
                  ColorRule(
                    color: Colors.purpleAccent,
                    rangeIndex: [41, 97],
                  ),
                  ColorRule(
                    color: Colors.green,
                    rangeIndex: [98, 100],
                  )
                ],
              )),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 20,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: LineProgressBarAnimation(
                duration: const Duration(seconds: 2),
                from: 0,
                to: _to,
                innerStrokeColor: Colors.purpleAccent,
                strokeColor: Colors.grey.shade300,
                innerStrokeWidth: 15,
                strokeWidth: 10,
              ),
            ),
          ),
          SizedBox(
            width: 150,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  double counter =
                      double.parse(math.Random().nextInt(100).toString());
                  log("counter${counter.toString()}");
                  setState(() {
                    _to = counter;
                  });
                },
                child: const Text("Rest")),
          )
        ],
      ),
    );
  }
}
