import 'package:flutter/material.dart';

class AnimtedIconExample extends StatefulWidget {
  const AnimtedIconExample({super.key});

  @override
  State<AnimtedIconExample> createState() => _AnimtedIconExampleState();
}

class _AnimtedIconExampleState extends State<AnimtedIconExample>
    with SingleTickerProviderStateMixin {
  bool isPlay = false;
  late AnimationController _controler;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controler =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _controler.addListener(
      () {},
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                if (!isPlay) {
                  _controler.forward();
                  isPlay = true;
                  setState(() {});
                } else {
                  _controler.reverse();
                  isPlay = false;
                  setState(() {});
                }
              },
              child: AnimatedIcon(
                  size: 75,
                  color: isPlay ? Colors.red : Colors.black,
                  icon: AnimatedIcons.play_pause,
                  progress: _controler),
            ),
          )
        ],
      ),
    );
  }
}
