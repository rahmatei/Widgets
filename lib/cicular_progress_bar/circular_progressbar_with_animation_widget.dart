import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CircularProgressbarWithAnimation extends StatelessWidget {
  final double from;
  final double to;
  final double strokeWidth;
  final double innerStrokeWidth;
  final Color strokeColor;
  final Color innerStrokeColor;
  final String symbol;
  final Duration? duration;
  final List<ColorRule>? colorConditions;
  final TextStyle? textStyle;

  CircularProgressbarWithAnimation(
      {super.key,
      this.from = 0,
      this.to = 100,
      this.strokeWidth = 5,
      this.innerStrokeWidth = 15,
      this.strokeColor = Colors.grey,
      this.innerStrokeColor = Colors.purpleAccent,
      this.symbol = "%",
      this.duration,
      this.colorConditions,
      this.textStyle});

  double _from = 0;
  double _to = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (Context, conntraint) {
        return Container(
          width: conntraint.maxWidth,
          height: conntraint.maxHeight,
          child: Stack(alignment: Alignment.center, children: [
            CustomPaint(
              painter: CirclePainter(
                  (conntraint.maxWidth / 2) - 10, strokeWidth, strokeColor),
            )
          ]),
        );
      },
    );
  }
}

class CirclePainter extends CustomPainter {
  final double radius;
  final double strokeWidth;
  final Color color;

  CirclePainter(this.radius, this.strokeWidth, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(const Offset(0, 0), radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ColorRule {
  final Color color;
  final List<double> rangeIndex;
  ColorRule(this.color, this.rangeIndex);
}
