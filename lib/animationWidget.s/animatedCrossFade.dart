import 'package:flutter/material.dart';

class AnimateCrossFade extends StatefulWidget {
  const AnimateCrossFade({super.key});

  @override
  State<AnimateCrossFade> createState() => _AnimateCrossFadeState();
}

class _AnimateCrossFadeState extends State<AnimateCrossFade> {
  bool first = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('AnimatedCrossFade Example'),
      ),
      body: Hero(
          tag: 'AnimatedCrossFade',
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  AnimatedCrossFade(
                      firstChild: AnimatedContainer(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(first ? 80 : 0),
                        ),
                        duration: const Duration(seconds: 5),
                      ),
                      secondChild: Container(
                        width: 200,
                        height: 200,
                        color: Colors.blue,
                      ),
                      crossFadeState: first
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 300)),
                  AnimatedPadding(
                    duration: Duration(seconds: 1),
                    padding: EdgeInsets.all(first ? 10 : 50),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          first = !first;
                        });
                      },
                      child: Text('Toggle'))
                ],
              ),
            ),
          )),
    );
  }
}
