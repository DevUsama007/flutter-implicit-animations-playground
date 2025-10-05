import 'dart:async';

import 'package:animationandscreenutil/animationWidget/animatedSwitcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Animatedpossition extends StatefulWidget {
  const Animatedpossition({super.key});

  @override
  State<Animatedpossition> createState() => _AnimatedpossitionState();
}

class _AnimatedpossitionState extends State<Animatedpossition> {
  togle() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      isLeft = !isLeft;
      setState(() {});
    });
  }

  bool isLeft = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    togle();
  }

  @override
  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width;
    var hei = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        isLeft = !isLeft;
        setState(() {});
      }),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Animated Possition'),
      ),
      body: Hero(
          tag: 'AnimatedPosition',
          child: Container(
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: Duration(seconds: 1),
                  left: isLeft ? 50 : 150,
                  // top: isLeft ? 50 : 150,
                  bottom: isLeft ? 300 : 400,
                  child: Container(
                      width: wid * 0.4, height: hei * 0.2, color: Colors.green),
                ),
                AnimatedPositioned(
                  duration: Duration(seconds: 1),
                  left: isLeft ? 150 : 50,
                  // top: isLeft ? 50 : 150,
                  bottom: isLeft ? 300 : 400,
                  child: Container(
                      width: wid * 0.4, height: hei * 0.2, color: Colors.blue),
                ),
                AnimatedPositioned(
                  duration: Duration(seconds: 1),
                  left: isLeft ? 150 : 50,
                  // top: isLeft ? 50 : 150,
                  bottom: isLeft ? 400 : 300,
                  child: Container(
                      width: wid * 0.4, height: hei * 0.2, color: Colors.red),
                ),
                AnimatedPositioned(
                  duration: Duration(seconds: 1),
                  left: isLeft ? 50 : 150,
                  // top: isLeft ? 50 : 150,
                  bottom: isLeft ? 400 : 300,
                  child: Container(
                      width: wid * 0.4,
                      height: hei * 0.2,
                      color: Colors.yellow),
                ),
              ],
            ),
          )),
    );
  }
}
