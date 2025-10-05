import 'package:animationandscreenutil/animationWidget/animatedAlighn.dart';
import 'package:animationandscreenutil/animationWidget/animatedContainer.dart';
import 'package:animationandscreenutil/animationWidget/animatedCrossFade.dart';
import 'package:animationandscreenutil/animationWidget/animatedOpacity.dart';
import 'package:animationandscreenutil/animationWidget/animatedPossition.dart';
import 'package:animationandscreenutil/animationWidget/animatedSwitcher.dart';
import 'package:animationandscreenutil/animationWidget/animatedtext.dart';
import 'package:animationandscreenutil/animationWidget/tweenAnimation.dart';
import 'package:flutter/material.dart';

import 'animationWidget/animatedList.dart';
import 'animationWidget/animatedPadding.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> animationList = [
    'AnimatedText',
    'AnimatedContainer',
    'AnimatedCrossFade',
    'AnimatedOpacity',
    'AnimatedPadding',
    'AnimatedPosition',
    'AnimatedAlign',
    'AnimatedSwitcher',
    'AnimatedList',
    'TweenAnimation',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Implicite Animations'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(animationList.length, (index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    switch (animationList[index]) {
                      case 'AnimatedText':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Anmatetext(),
                            ));
                        break;
                      case 'AnimatedContainer':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AnimatedContainerr(),
                            ));
                        break;
                      case 'AnimatedSwitcher':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AnimatedSwitcherExample(),
                            ));
                        break;
                      case 'AnimatedOpacity':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Animatedopacity(),
                            ));
                        break;
                      case 'AnimatedCrossFade':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AnimateCrossFade(),
                            ));
                        break;
                      case 'AnimatedPadding':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AnimatedPaddingW(),
                            ));
                        break;
                      case 'AnimatedPosition':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Animatedpossition(),
                            ));
                        break;
                      case 'AnimatedAlign':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AnimatedAlignment(),
                            ));
                        break;
                      case 'AnimatedList':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AnimatedListExample(),
                            ));
                        break;
                      case 'TweenAnimation':
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TweenAnimationWidget(),
                            ));
                        break;
                      default:
                    }
                  },
                  child: Hero(
                    transitionOnUserGestures: true,
                    tag: animationList[index],
                    child: Card(
                      child: ListTile(
                        title: Text(animationList[index]),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
