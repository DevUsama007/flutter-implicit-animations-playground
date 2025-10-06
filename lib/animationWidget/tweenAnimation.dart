import 'package:flutter/material.dart';

class TweenAnimationWidget extends StatefulWidget {
  const TweenAnimationWidget({super.key});

  @override
  State<TweenAnimationWidget> createState() => _TweenAnimationWidgetState();
}

class _TweenAnimationWidgetState extends State<TweenAnimationWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color.fromARGB(255, 212, 212, 212),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TweenAnimationBuilder(
              child: Text(
                'DevUsama007',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(seconds: 2),
              curve: Curves.easeInCirc,
              builder: (context, double tweenValue, child) {
                return Opacity(
                  opacity: tweenValue,
                  child: Padding(
                    padding: EdgeInsets.only(top: tweenValue * 20),
                    child: child,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
