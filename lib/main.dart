import 'package:animationandscreenutil/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'animationWidget.s/animatedtext.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Homepage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.red,
                height: 400,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.center,
                  child: AspectRatio(
                    aspectRatio: 4 / 1, // width : height ratio
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10.w),
                color: Colors.red,
                width: 50.w,
                height: 50.w,
              ),
              Text(
                MediaQuery.of(context).size.width.toString(),
                style: TextStyle(color: Colors.black, fontSize: 16.sp),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 360) {
                    // Small screen (mobile)
                    return Column(
                      children: [
                        Text("This is mobile view"),
                        Icon(Icons.phone_android),
                      ],
                    );
                  } else {
                    // Large screen (tablet/desktop)
                    return Column(
                      children: [
                        Text("This is tablet/desktop view"),
                        Icon(Icons.desktop_windows),
                      ],
                    );
                  }
                },
              ),

              Icon(
                Icons.home,
                size: 40,
              ),
//If you want to display a square based on width:
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    borderRadius: BorderRadius.circular(30.r)),
                width: 360.w,
                height: 300.w,
                child: Text(
                  'stand in front of either wicket holding bats, while one player from the fielding team, stand in front of either wicket holding bats, while one player from the fielding team, stand in front of either wicket holding bats, while one player from the fielding team, stand in front of either wicket holding bats, while one player from the fielding team, ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp.clamp(16, 20),
                  ),
                  // overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    borderRadius: BorderRadius.circular(30)),
                width: 360.w,
                height: 300.w,
                child: Text(
                  'stand in front of either wicket holding bats, while one player from the fielding team, stand in front of either wicket holding bats, while one player from the fielding team, stand in front of either wicket holding bats, while one player from the fielding team, stand in front of either wicket holding bats, while one player from the fielding team, ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp.clamp(16, 20),
                  ),
                  // overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
              ),

              Text(
                '$_counter',
                style: TextStyle(fontSize: 45.sp),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
