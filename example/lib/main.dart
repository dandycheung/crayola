import 'dart:async';
import 'package:crayola/crayola.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showTitle;
  bool showTitleBar;

  @override
  void initState() {
    super.initState();
    showTitle = false;
    showTitleBar = true;
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    await Crayola.setTitleBarColor(Color.fromARGB(255, 76, 75, 80));
    await Crayola.setTitleVisibility(false);
    if (!mounted) return;
  }

  void setTitle(bool value) {
    Crayola.setTitleVisibility(value);
    setState(() {
      showTitle = value;
    });
  }

  void setTitleBar(bool value) {
    Crayola.setTitleBarVisibility(value);
    setState(() {
      showTitleBar = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Scaffold(
        body: Column(
          children: [
            Container(
              height: 48.0,
              color: Color.fromARGB(255, 76, 75, 80),
              child: Row(
                mainAxisSize: MainAxisSize.max,
              ),
            ),
            SwitchListTile.adaptive(
              title: const Text('Show title'),
              value: showTitle,
              onChanged: setTitle,
            ),
            SwitchListTile.adaptive(
              title: const Text('Show title bar'),
              value: showTitleBar,
              onChanged: setTitleBar,
            ),
          ],
        ),
      ),
    );
  }
}
