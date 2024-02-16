import 'dart:developer';

import 'package:flut_dynamic_icon_example/app_icons.dart';
import 'package:flut_dynamic_icon_example/dynamic_app_icon_utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dynamic App Icon'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  DynamicAppIconUtils.changeAppIcon(AppIcons.tetoIcon);
                },
                child: const Text("Change Icon to teto"),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    DynamicAppIconUtils.changeAppIcon(AppIcons.halalIcon);
                  } catch (e) {
                    log(e.toString(), name: "ChangeIcon");
                  }
                },
                child: const Text("Change Icon to halal"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
