import 'package:animationandscreenutil/explicitAnimationInFlutter/animatedIcon.dart';
import 'package:animationandscreenutil/explicitAnimationInFlutter/explicitHomeScreen.dart';
import 'package:animationandscreenutil/homepage.dart';
import 'package:flutter/material.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({super.key});

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();
  List<String> aniList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        updateList();
      },
    );
  }

  updateList() {
    List<String> updateList = ['Implicit', 'Explicit'];
    Future ft = Future(
      () {},
    );
    for (var i = 0; i < updateList.length; i++) {
      ft = ft.then(
        (value) {
          return Future.delayed(
            Duration(seconds: 1),
            () {
              print(i);
              aniList.add(updateList[i]);
              _key.currentState?.insertItem(aniList.length - 1);
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Animations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          child: AnimatedList(
            key: _key,
            initialItemCount: aniList.length,
            itemBuilder: (context, index, animation) {
              return SlideTransition(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      aniList[index] == 'Implicit'
                          ? Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Homepage();
                              },
                            ))
                          : Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Explicithomescreen();
                              },
                            ));
                      ;
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text(
                            aniList[index],
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  position: animation
                      .drive(Tween(begin: Offset(1, 0), end: Offset(0, 0))));
            },
          ),
        ),
      ),
    );
  }
}
