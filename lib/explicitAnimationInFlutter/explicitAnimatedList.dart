import 'dart:async';

import 'package:flutter/material.dart';

class ExplicitAnimatedList extends StatefulWidget {
  const ExplicitAnimatedList({super.key});

  @override
  State<ExplicitAnimatedList> createState() => _ExplicitAnimatedListState();
}

class _ExplicitAnimatedListState extends State<ExplicitAnimatedList> {
  List myList = [];
  List myList2 = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();
  final GlobalKey<AnimatedListState> _key1 = GlobalKey<AnimatedListState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        addList();
        addList2();
      },
    );
  }

  addList() {
    List<String> myListAdd = [
      'Usama Basharat',
      'Hassan Basharat',
      'Hamza Sharafat',
      'Ali Sharafat',
      'Fahad karamat',
      'Faiq Karamat',
      'Furqan Karamat'
    ];
    Future ft = Future(
      () {},
    );
    for (var i = 0; i < myListAdd.length; i++) {
      ft = ft.then(
        (value) async {
          await Future.delayed(
            Duration(milliseconds: 200),
            () {
              myList.add(myListAdd[i]);
              _key.currentState?.insertItem(myList.length - 1);
            },
          );
        },
      );
    }
  }

  addList2() {
    List<String> myListAdd2 = [
      'Usama Basharat',
      'Hassan Basharat',
      'Hamza Sharafat',
      'Ali Sharafat',
      'Fahad karamat',
      'Faiq Karamat',
      'Furqan Karamat'
    ];
    Future ft = Future(
      () {},
    );
    for (var i = 0; i < myListAdd2.length; i++) {
      ft = ft.then(
        (value) async {
          await Future.delayed(
            Duration(milliseconds: 100),
            () {
              myList2.add(myListAdd2[i]);
              _key1.currentState?.insertItem(myList2.length - 1);
            },
          );
        },
      );
    }
  }

  void _removeItem(int index) {
    final String removedItem = myList2.removeAt(index);
    _key1.currentState!.removeItem(
      index,
      (context, animation) => SlideTransition(
        position: Tween<Offset>(
          begin: Offset(1, -1),
          end: Offset(0, 0),
        ).animate(animation),
        child: Card(
          child: Text('Item $removedItem'),
        ),
      ),
    );
  }

  addItem() {
    myList2.add('Developer Group ${myList2.length}');
    _key1.currentState?.insertItem(myList2.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Animated List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItem();
        },
      ),
      body: Column(
        children: [
          Center(
              child: Text(
            'That is the animated list'.toString().toUpperCase(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: AnimatedList(
              scrollDirection: Axis.horizontal,
              key: _key,
              initialItemCount: myList.length,
              itemBuilder: (context, index, animation) {
                return SlideTransition(
                    child: InkWell(
                      // onTap: () {
                      //   _removeItem(index);
                      // },
                      child: Card(
                          child: Center(
                              child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(myList[index].toString()),
                      ))),
                    ),
                    position: animation
                        .drive(Tween(begin: Offset(1, 0), end: Offset(0, 0))));
              },
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: AnimatedList(
                scrollDirection: Axis.vertical,
                key: _key1,
                initialItemCount: myList2.length,
                itemBuilder: (context, index, animation) {
                  int currentIndex = index;
                  print(currentIndex);
                  return SlideTransition(
                      child: InkWell(
                        onTap: () {
                          _removeItem(index);
                        },
                        child: Card(
                            color: Colors.red,
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(myList2[currentIndex]),
                            ))),
                      ),
                      position: animation.drive(
                          Tween(begin: Offset(-1, 8), end: Offset(0, 0))));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
