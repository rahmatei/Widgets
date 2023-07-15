import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveHome extends StatefulWidget {
  HiveHome({super.key});

  @override
  State<HiveHome> createState() => _HiveHomeState();
}

class _HiveHomeState extends State<HiveHome> {
  Box? myBox;
  Future<Box> openHiveBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    return await Hive.openBox(boxName);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Future<void> didChangeDependencies() async {
    myBox = await openHiveBox('CheckSplash');
    super.didChangeDependencies();
  }

  @override
  Future<void> didUpdateWidget(covariant HiveHome oldWidget) async {
    myBox = await openHiveBox('CheckSplash');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MaterialButton(
          color: Colors.green,
          onPressed: () {
            //myBox!.put('status', 'Hossein');
            myBox!.put('status', {'ShowSplash': 'true', 'count': 1});
            log("------------------------------------>Success Put");
          },
          child: const Text("Put"),
        ),
        MaterialButton(
          color: Colors.orange,
          onPressed: () {
            log("------------------------------------>${myBox!.get('status')}");
            log("------------------------------------>Success Get");
          },
          child: const Text('Get'),
        ),
        MaterialButton(
          color: Colors.red,
          onPressed: () {
            myBox!.delete('status');
            //myBox!.deleteAll(["status", ""]);
            //myBox!.clear();
            log("------------------------------------>Delete");
            log("------------------------------------>Success Delete");
          },
          child: const Text('Delete'),
        )
      ],
    );
  }
}
