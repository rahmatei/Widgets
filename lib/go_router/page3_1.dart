import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page3_1 extends StatelessWidget {
  final String id;

  const Page3_1({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Text('Page3_1 And id= $id'),
            TextButton(
                onPressed: () => context.pop(), child: const Text('Back'))
          ],
        ),
      )),
    );
  }
}
