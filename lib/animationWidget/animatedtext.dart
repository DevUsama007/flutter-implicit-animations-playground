import 'package:animationandscreenutil/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Anmatetext extends StatefulWidget {
  const Anmatetext({super.key});

  @override
  State<Anmatetext> createState() => _AnmatetextState();
}

class _AnmatetextState extends State<Anmatetext> {
  int num = 0;
  bool isbig = false;
  bool iswrap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Animate Text'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => AnimatedSwitcherExample(),
          //     ));
          num = num + 1;
          isbig = !isbig;
          iswrap = !iswrap;
          setState(() {});
        },
      ),
      body: Hero(
        tag: 'AnimatedText',
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Center(
              //   child: Text(
              //     num.toString(),
              //     style: TextStyle(fontSize: 30),
              //   ),
              // ),
              // Center(
              //   child: AnimatedDefaultTextStyle(
              //     maxLines: iswrap ? 1 : 5,
              //     // softWrap: iswrap,
              //     duration: Duration(seconds: 1),

              //     style: TextStyle(
              //       // maxLines: iswrap ? 1 : 5,
              //       // overflow: TextOverflow.ellipsis,
              //       // fontSize: isbig ? 50 : 20, // changes based on condition
              //       color: isbig ? Colors.red : Colors.blue,
              //     ),
              //     child: Text(
              //         "num.toString() is the number of the text style you can use for the random tree making and the whole work is automated and we are pleased to inform you that this is the best way to do it  and we are pleased to inform you that this is the best way to do it "),
              //   ),
              // ),
              Center(
                child: AnimatedSize(
                  // ← This animates the size change
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  child: AnimatedDefaultTextStyle(
                    maxLines: iswrap ? 1 : 5,
                    duration: Duration(seconds: 1),
                    style: TextStyle(
                      color: isbig ? Colors.red : Colors.blue,
                    ),
                    child: Text(
                      "num.toString() is the number of the text style you can use for the random tree making and the whole work is automated and we are pleased to inform you that this is the best way to do it and we are pleased to inform you that this is the best way to do it",
                    ),
                  ),
                ),
              ),
              AnimatedOpacity(
                  curve: Curves.easeInCubic,
                  child: Text(
                    num.toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                  opacity: isbig ? 0.0 : 0.4,
                  duration: Duration(seconds: 1)),
              AnimatedDefaultTextStyle(
                duration: Duration(seconds: 1),
                style: TextStyle(
                  fontSize: isbig ? 50 : 20, // changes based on condition
                  color: isbig ? Colors.red : Colors.blue,
                ),
                child: Text(num.toString()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
