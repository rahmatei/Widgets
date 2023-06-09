import 'package:flutter/material.dart';
import 'dart:math' as math;

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
      this.innerStrokeWidth = 10,
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
    _from = from / 100;
    _to = to / 100;

    return LayoutBuilder(
      builder: (context, conntraint) {
        return SizedBox(
          width: conntraint.maxWidth,
          height: conntraint.maxHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                painter: CirclePainter(
                    (conntraint.maxWidth / 2) - 10, strokeWidth, strokeColor),
              ),
              TweenAnimationBuilder(
                tween: Tween(begin: _from, end: _to),
                duration: duration ?? const Duration(seconds: 1),
                curve: Curves.easeInOut,
                builder: (context, value, child) {
                  Color color = _getConditionalColor(value) ?? innerStrokeColor;
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      CustomPaint(
                        painter: ArcPainter(
                            color: color,
                            radius: (conntraint.maxWidth) - 20,
                            strokeWidth: innerStrokeWidth,
                            from: _from,
                            to: value),
                      ),
                      Text(
                        '${(value * 100).toInt()}$symbol',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: color),
                      )
                    ],
                  );
                },
              )
            ],
          ),
        );
      },
    );
  } // end build

  Color? _getConditionalColor(double index) {
    index = index >= 0.99 ? 100 : index * 100;
    List<ColorRule> colorRule = colorConditions!
        .where((element) =>
            (index >= element.rangeIndex[0] && index <= element.rangeIndex[1]))
        .toList();
    if (colorRule.isNotEmpty) {
      return colorRule.first.color;
    } else {
      return null;
    }
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

class ArcPainter extends CustomPainter {
  final double radius;
  final double strokeWidth;
  final Color color;
  final double from;
  final double to;

  ArcPainter(
      {required this.radius,
      required this.strokeWidth,
      required this.color,
      required this.from,
      required this.to});

  double degtoRad(double deg) => deg * (math.pi / 180);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
        Rect.fromCenter(
            center: const Offset(0, 0), width: radius, height: radius),
        degtoRad(from * 360),
        degtoRad(to * 360),
        false,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ColorRule {
  final Color color;
  final List<double> rangeIndex;
  ColorRule({required this.color, required this.rangeIndex});
}
