import 'dart:async';

import 'package:flutter/material.dart';

class Animatedopacity extends StatefulWidget {
  const Animatedopacity({super.key});

  @override
  State<Animatedopacity> createState() => _AnimatedopacityState();
}

class _AnimatedopacityState extends State<Animatedopacity> {
  double opacity = 0.2;
  bool show = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 1), () {
      opacity = 1.0;
      show = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Animated Opacity'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Opacity: ${opacity.toString()}'),
            ),
            Center(
              child: AnimatedOpacity(
                opacity: opacity,
                curve: Curves.decelerate,
                duration: Duration(seconds: 1),
                child: FlutterLogo(
                  size: 200,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                opacity = opacity == 0.2 ? 1.0 : 0.2;
                // show = !show;
                setState(() {});
              },
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 200,
                duration: Duration(seconds: 1),
                height: show ? 50 : 0,
                child: Center(
                  child: Text(
                    "Change Opacity",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
