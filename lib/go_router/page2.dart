import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const Text('Page2'),
            TextButton(
                onPressed: () =>
                    context.goNamed('page3_1', queryParams: {'id': '10'}),
                //context.go('/page3/page3_1'),
                child: const Text('Go To Page3_1'))
          ],
        ),
      )),
    );
  }
}
