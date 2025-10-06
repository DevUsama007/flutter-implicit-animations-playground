import 'package:animationandscreenutil/explicitAnimationInFlutter/animatedIcon.dart';
import 'package:animationandscreenutil/explicitAnimationInFlutter/explicitAnimatedList.dart';
import 'package:flutter/material.dart';

class Explicithomescreen extends StatefulWidget {
  const Explicithomescreen({super.key});

  @override
  State<Explicithomescreen> createState() => _ExplicithomescreenState();
}

class _ExplicithomescreenState extends State<Explicithomescreen> {
  List<String> animationList = [
    'AnimatedIcon',
    'TweenSequence',
    'AnimatedList'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: Duration(seconds: 1),
            builder: (context, value, child) {
              return Padding(
                padding: EdgeInsets.only(
                  top: value * 1,
                ),
                child: Opacity(
                  opacity: value,
                  child: child,
                ),
              );
            },
            child: Text('Explicit Animation')),
      ),
      body: Column(
        children: List.generate(
          animationList.length,
          (index) {
            return TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(seconds: 1),
              builder: (context, value, child) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: value * 10,
                  ),
                  child: Opacity(
                    opacity: value,
                    child: child,
                  ),
                );
              },
              child: InkWell(
                onTap: () {
                  animationList[index].toString() == 'AnimatedIcon'
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AnimtedIconExample(),
                          ))
                      : animationList[index].toString() == 'TweenSequence'
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Explicithomescreen(),
                              ))
                          : animationList[index].toString() == 'AnimatedList'
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ExplicitAnimatedList(),
                                  ))
                              : null;
                },
                child: Card(
                  child: ListTile(
                    title: Text(animationList[index]),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
