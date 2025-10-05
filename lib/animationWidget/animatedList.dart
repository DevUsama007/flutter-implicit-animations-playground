import 'dart:async';

import 'package:flutter/material.dart';

class AnimatedListExample extends StatefulWidget {
  const AnimatedListExample({super.key});

  @override
  State<AnimatedListExample> createState() => _AnimatedListExampleState();
}

class _AnimatedListExampleState extends State<AnimatedListExample> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final List<int> _items = [];
  final List<int> allitems = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  void _addItem() {
    final int index = _items.length;
    _items.add(index + 1);
    _listKey.currentState!.insertItem(
      index,
      duration: const Duration(milliseconds: 500),
    );
  }

  void _removeItem(int index) {
    final int removedItem = _items.removeAt(index);
    _listKey.currentState!.removeItem(
      index,
      (context, animation) => SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, 0),
          end: Offset(1, 0),
        ).animate(animation),
        child: ListTile(
          title: Text('Item $removedItem'),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        setState(() {
          _items.addAll(allitems);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedList Example")),
      body: Container(
        child: _items.length == 0
            ? Center(child: CircularProgressIndicator())
            : AnimatedList(
                key: _listKey,
                initialItemCount: _items.length,
                itemBuilder: (context, index, animation) {
                  return SizeTransition(
                    sizeFactor: animation,
                    child: ListTile(
                      title: Text('Item ${_items[index]}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _removeItem(index),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}
