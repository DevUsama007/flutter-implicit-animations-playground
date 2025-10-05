import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedSwitcherExample extends StatefulWidget {
  @override
  _AnimatedSwitcherExampleState createState() =>
      _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  int num = 0;
  bool isTop = false;
  double number = 0.3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('AnimatedSwitcher Example'),
      ),
      body: Hero(
        tag: 'AnimatedSwitcher',
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10,
              ),
              AnimatedPhysicalModel(
                duration: Duration(seconds: 1),
                shape: BoxShape.rectangle,
                elevation: isTop ? 12 : 2,
                color: Colors.blue,
                shadowColor: Colors.black,
                child: Container(
                  width: 100,
                  height: 100,
                  child: FlutterLogo(
                    style: FlutterLogoStyle.stacked,
                  ),
                ),
              ),
              SizedBox(
                height: 29,
              ),
              TweenAnimationBuilder<double>(
                duration: Duration(seconds: 1),
                tween: Tween<double>(begin: 0, end: number),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.scale(
                      scale: value,
                      child: child,
                    ),
                  );
                },
                child: Column(
                  children: [
                    FlutterLogo(size: 100),
                    Text('Hello, Flutter!', style: TextStyle(fontSize: 24.sp))
                  ],
                ),
              ),
              AnimatedAlign(
                duration: Duration(seconds: 1),
                alignment: isTop ? Alignment.bottomLeft : Alignment.bottomRight,
                child: FlutterLogo(size: 60),
              ),
              AnimatedSwitcher(
                switchInCurve: Curves.slowMiddle,
                switchOutCurve: Curves.fastOutSlowIn,
                // reverseDuration: Duration(seconds: 5),
                duration: Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  // You can use different animations here (fade, scale, slide)
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Text(
                  '$num',
                  key: ValueKey<int>(num), // important for AnimatedSwitcher
                  style:
                      TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  isTop = !isTop;
                  number = number == 0.3 ? 1 : 0.3;
                  // number = number == 0.7 ? 1 : 0.3;
                  setState(() {
                    num++;
                  });
                },
                child: Text("Increase"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
