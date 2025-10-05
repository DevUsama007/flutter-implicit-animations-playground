import 'package:animationandscreenutil/animationWidget/animatedSwitcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedContainerr extends StatefulWidget {
  const AnimatedContainerr({super.key});

  @override
  State<AnimatedContainerr> createState() => _AnimatedContainerrState();
}

class _AnimatedContainerrState extends State<AnimatedContainerr> {
  double wid = 300.w;
  double hei = 200.h;
  Color col = Colors.red;
  BorderRadius bor = BorderRadius.circular(0.r);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Animated Container'),
      ),
      body: Hero(
          tag: 'AnimatedContainer',
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedPadding(
                      padding: EdgeInsets.only(top: 30),
                      duration: Duration(seconds: 1)),
                  Center(
                    child: AnimatedContainer(
                      width: wid,
                      height: hei,
                      duration: Duration(
                        seconds: 2,
                      ),
                      decoration: BoxDecoration(color: col, borderRadius: bor),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        wid = wid == 300.w ? 400.w : 300.w;
                        hei = hei == 200.h ? 300.h : 200.h;
                        col = col == Colors.red ? Colors.blue : Colors.red;
                        bor = bor == BorderRadius.circular(0.r)
                            ? BorderRadius.circular(250.r)
                            : BorderRadius.circular(0.r);
                        setState(() {});
                      },
                      child: Text('Change')),
                ],
              ),
            ),
          )),
    );
  }
}
