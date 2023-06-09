import 'package:flutter/material.dart';

class LineProgressBarAnimation extends StatelessWidget {
  final double from;
  final double to;
  final double strokeWidth;
  final double innerStrokeWidth;
  final Color strokeColor;
  final Color innerStrokeColor;
  final Duration? duration;

  const LineProgressBarAnimation(
      {super.key,
      this.from = 0,
      this.to = 100,
      this.strokeWidth = 10,
      this.innerStrokeWidth = 15,
      this.strokeColor = Colors.grey,
      this.innerStrokeColor = Colors.purpleAccent,
      this.duration});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return SizedBox(
          width: constraint.maxWidth,
          height: constraint.maxHeight,
          child: Stack(children: [
            CustomPaint(
              painter: LinePaint(
                  color: strokeColor,
                  strokeWidth: strokeWidth,
                  from: 0,
                  to: constraint.maxWidth),
            ),
            TweenAnimationBuilder(
              tween: Tween(begin: 0, end: (to / 100)),
              duration: duration ?? const Duration(seconds: 1),
              curve: Curves.easeInToLinear,
              builder: (context, value, child) {
                return CustomPaint(
                  painter: LinePaint(
                      color: Colors.green,
                      strokeWidth: strokeWidth,
                      from: 0,
                      to: constraint.maxWidth * value),
                );
              },
            )
          ]),
        );
      },
    );
  }
}

class LinePaint extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double from;
  final double to;
  LinePaint(
      {required this.color,
      required this.strokeWidth,
      required this.from,
      required this.to});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(const Offset(0, 0), Offset(to, 0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
