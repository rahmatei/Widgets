import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Animate extends StatefulWidget {
  Animate({super.key});

  @override
  State<Animate> createState() => _AnimateState();
}

class _AnimateState extends State<Animate> {
  List<Widget> boxs = [const Box1(), const Box2(), const Box3()];

  int _tapcount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: const Text(
              'Hello',
              style: TextStyle(fontSize: 20),
            ).animate().fade(delay: 500.ms).slide(),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('Hello1', style: TextStyle(fontSize: 20))
              .animate()
              .fade(duration: const Duration(milliseconds: 500))
              .slideX(curve: Curves.easeIn),
          const Text('Hello2', style: TextStyle(fontSize: 20))
              .animate()
              .slideY(begin: 2, end: 5),
          const Text('Hello3', style: TextStyle(fontSize: 20))
              .animate()
              .tint(color: Colors.red)
              .then()
              .shake(),
          const Text('Hello Condition', style: TextStyle(fontSize: 20))
              .animate(target: _tapcount == 4 ? 1 : 0)
              .tint(color: Colors.orange)
              .then()
              .shake(),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _tapcount <= 5 ? ++_tapcount : _tapcount = 0;
                });
              },
              child: Text('add')),
        ],
        //boxs.animate().fade(curve: Curves.easeIn).scaleX(duration: const Duration(milliseconds: 500))
        //boxs.animate(interval: .250.seconds).scaleX(duration: const Duration(milliseconds: 500))
      )),
    );
  }
}

class Box1 extends StatelessWidget {
  const Box1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: const Center(child: Text('Box1')),
    );
  }
}

class Box2 extends StatelessWidget {
  const Box2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.yellow,
      child: const Center(child: Text('Box2')),
    );
  }
}

class Box3 extends StatelessWidget {
  const Box3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.blue,
      child: const Center(child: Text('Box3')),
    );
  }
}
