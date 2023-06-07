import 'package:flutter/material.dart';

class MyRawMagnifier extends StatefulWidget {
  const MyRawMagnifier({super.key});

  @override
  State<MyRawMagnifier> createState() => _MyRawMagnifierState();
}

class _MyRawMagnifierState extends State<MyRawMagnifier> {
  Offset dragGesturePosition = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Drag on The logo'),
              RepaintBoundary(
                child: Stack(
                  children: [
                    GestureDetector(
                      onPanUpdate: (details) => setState(() {
                        dragGesturePosition = details.localPosition;
                      }),
                      child: const FlutterLogo(
                        size: 200,
                      ),
                    ),
                    Positioned(
                        left: dragGesturePosition.dx,
                        top: dragGesturePosition.dy,
                        child: const RawMagnifier(
                          decoration: MagnifierDecoration(
                            shape: CircleBorder(
                              side: BorderSide(color: Colors.pink, width: 3),
                            ),
                          ),
                          size: Size(50, 50),
                          magnificationScale: 2,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
