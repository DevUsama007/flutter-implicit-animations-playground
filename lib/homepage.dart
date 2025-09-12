import 'package:animationandscreenutil/animationWidget.s/animatedOpacity.dart';
import 'package:animationandscreenutil/animationWidget.s/animatedSwitcher.dart';
import 'package:animationandscreenutil/animationWidget.s/animatedtext.dart';
import 'package:flutter/material.dart';

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
    'HeroAnimation',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Implicite Animations'),
      ),
      body: Column(
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
    );
  }
}
