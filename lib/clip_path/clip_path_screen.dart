import 'package:flutter/material.dart';

class ClipPathScreen extends StatelessWidget {
  const ClipPathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            color: Colors.blue[50],
            height: 320,
          ),
        ),
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            color: Colors.blue[100],
            height: 300,
          ),
        ),
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            color: Colors.blue[200],
            height: 280,
          ),
        ),
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            color: Colors.blue[300],
            height: 260,
          ),
        ),
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            color: Colors.blue[400],
            height: 240,
          ),
        ),
        ClipPath(
          clipper: WaveClipper(),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blue[600],
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://fastly.picsum.photos/id/342/500/300.jpg?hmac=9MgY6fxV46rNQQqcMfKQAr0kchlprxqMOxn9enZBWoE'),
                    fit: BoxFit.cover)),
            height: 220,
          ),
        ),
      ],
    ));
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);

    var firstStart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 2.25, size.height - 50);

    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    var secondEnd = Offset(size.width, size.height - 10);

    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
