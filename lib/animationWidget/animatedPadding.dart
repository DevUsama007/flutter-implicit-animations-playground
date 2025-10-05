import 'package:flutter/material.dart';

class AnimatedPaddingW extends StatefulWidget {
  const AnimatedPaddingW({super.key});

  @override
  State<AnimatedPaddingW> createState() => _AnimatedPaddingWState();
}

class _AnimatedPaddingWState extends State<AnimatedPaddingW> {
  double padd = 10.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Padding'),
      ),
      body: Hero(
        tag: 'AnimatedPadding',
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.blue,
                child: AnimatedPadding(
                  padding: EdgeInsets.all(padd.toDouble()),
                  duration: Duration(seconds: 2),
                  curve: Curves.easeInOut,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
                    child: Text(
                        textAlign: TextAlign.justify,
                        'Hi This is Animated Padding and i am doing the animation using this with implicit padding work'),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    padd = padd == 10.0 ? 50.0 : 10.0;
                    setState(() {});
                  },
                  child: Text('Change Padding'))
            ],
          ),
        ),
      ),
    );
  }
}
