import 'dart:async';

import 'package:animationandscreenutil/animationWidget.s/animatedSwitcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedAlignment extends StatefulWidget {
  const AnimatedAlignment({super.key});

  @override
  State<AnimatedAlignment> createState() => _AnimatedAlignmentState();
}

class _AnimatedAlignmentState extends State<AnimatedAlignment> {
  togle() {
    Timer.periodic(Duration(seconds: 4), (timer) {
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
        title: Text('Animated Alignment'),
      ),
      body: Hero(
          tag: 'AnimatedAlign',
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AnimatedAlign(
                    alignment:
                        isLeft ? Alignment.topLeft : Alignment.bottomRight,
                    duration: Duration(seconds: 3),
                    child: Container(
                      child: FlutterLogo(size: 100),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
