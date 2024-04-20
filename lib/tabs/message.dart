import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../tools/keepAliveWrapper.dart';
import 'dart:async';
import 'dialog.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _pageViewCount = 3;
  int _cycleCurrentIndex = 0;

  int _timerCycleCurrentIndex = 0;
  late PageController _pageController;
  Timer? _timer;

  // use the LocalKey will lost the state, when rotate the screen and change the layout
  // final List<Widget> _boxlist = [
  //   Box(color: Colors.red, key: UniqueKey()),
  //   const Box(color: Colors.blue, key: ValueKey(1)),
  //   const Box(color: Colors.green, key: ObjectKey(Text(""))),
  // ];

  // use GlobalKey can save state, when rotate the screen and change the layout
  final List<Widget> _boxlist = [
    Box(color: Colors.red, key: GlobalKey()),
    Box(color: Colors.blue, key: GlobalKey()),
    Box(color: Colors.green, key: GlobalKey()),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    _tabController.addListener(() {
      if (_tabController.animation!.value == _tabController.index) {
        print(_tabController.index);

        if (_timer != null) {
          _timer!.cancel();
        }

        if (_tabController.index == 1) {
          setState(() {
            _timerCycleCurrentIndex = 0;
          });

          _timer = Timer.periodic(const Duration(seconds: 1), (t) {
            _pageController.animateToPage((_timerCycleCurrentIndex + 1) % 3,
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear);
          });
        }
      }
    });

    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _pageController.dispose();

    if (_timer != null) {
      _timer!.cancel();
    }
  }

  List<Widget> _tabItems() {
    return [
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
            onPressed: () async {
              print(await showAlertDialog(context));
            },
            child: const Text("Alert Dialog")),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () async {
              print(await showSimpleDialog(context));
            },
            child: const Text("Simple Dialog")),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () async {
              print(await showCDialog(context,
                  title: "警告！", content: "我是一个警告信息!"));
            },
            child: const Text("Customer Dialog")),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () async {
              print(await modelButtonSheet(context));
            },
            child: const Text("model Button Sheet")),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              // no context version only supports android, ios and web
              Fluttertoast.showToast(
                  msg: "This is Center Short Toast",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
            child: const Text("Default Toast"))
      ]),
      Column(
        children: [
          Container(
              height: 100,
              color: Colors.green,
              child: PageView(children: const [
                Center(child: Text("第1屏", style: TextStyle(fontSize: 25))),
                Center(child: Text("第2屏", style: TextStyle(fontSize: 25))),
                Center(child: Text("第3屏", style: TextStyle(fontSize: 25))),
                Center(child: Text("第4屏", style: TextStyle(fontSize: 25))),
              ])),
          Container(
              height: 100,
              color: Colors.red,
              child: PageView(scrollDirection: Axis.vertical, children: const [
                Center(child: Text("第1屏", style: TextStyle(fontSize: 25))),
                Center(child: Text("第2屏", style: TextStyle(fontSize: 25))),
                Center(child: Text("第3屏", style: TextStyle(fontSize: 25))),
                Center(child: Text("第4屏", style: TextStyle(fontSize: 25))),
              ])),
          Container(
              height: 100,
              color: Colors.blue,
              child: PageView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Center(
                        child: Text("第$index屏",
                            style: const TextStyle(fontSize: 25)));
                  })),
          Container(
              height: 100,
              color: Colors.pink,
              child: PageView.builder(
                  itemCount: _pageViewCount,
                  onPageChanged: (index) {
                    if (index == _pageViewCount - 2) {
                      setState(() {
                        _pageViewCount += 3;
                      });
                    }
                  },
                  itemBuilder: (context, index) {
                    return KeepAliveWrapper(
                        child: Center(
                            child: Text("第$index屏(无限滑动)",
                                style: const TextStyle(fontSize: 25))));
                  })),
          Container(
              height: 100,
              color: Colors.green,
              child: PageView.builder(
                  itemCount: 1000,
                  onPageChanged: (index) => setState(() {
                        _cycleCurrentIndex = index;
                      }),
                  itemBuilder: (context, index) {
                    List<Widget> items = const [
                      Center(
                          child: Text("第1屏(循环轮播)",
                              style: TextStyle(fontSize: 25))),
                      Center(
                          child: Text("第2屏(循环轮播)",
                              style: TextStyle(fontSize: 25))),
                      Center(
                          child:
                              Text("第3屏(循环轮播)", style: TextStyle(fontSize: 25)))
                    ];
                    return Stack(children: [
                      items[index % items.length],
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: 2,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(items.length, (index) {
                                return Container(
                                    margin: const EdgeInsets.all(5),
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        color:
                                            _cycleCurrentIndex % items.length ==
                                                    index
                                                ? Colors.blue
                                                : Colors.grey,
                                        shape: BoxShape.circle));
                              })))
                    ]);
                  })),
          Container(
              height: 100,
              color: Colors.pink,
              child: PageView.builder(
                  itemCount: 10000,
                  controller: _pageController,
                  onPageChanged: (index) {
                    _timerCycleCurrentIndex = index;
                  },
                  itemBuilder: (context, index) {
                    List<Widget> items = const [
                      Center(
                          child: Text("第1屏(自动循环轮播)",
                              style: TextStyle(fontSize: 25))),
                      Center(
                          child: Text("第2屏(自动循环轮播)",
                              style: TextStyle(fontSize: 25))),
                      Center(
                          child: Text("第3屏(自动循环轮播)",
                              style: TextStyle(fontSize: 25)))
                    ];
                    return items[index % items.length];
                  })),
        ],
      ),
      Center(
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: _boxlist),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() => _boxlist.shuffle());
                          },
                          icon: const Icon(Icons.refresh),
                          label: const Text("刷新")))
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: _boxlist),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() => _boxlist.shuffle());
                          },
                          icon: const Icon(Icons.refresh),
                          label: const Text("刷新")))
                ],
              ),
      ),
      const ChangeState(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TabBar(controller: _tabController, tabs: const [
        Tab(child: Text("Dialog演示")),
        Tab(child: Text("PageView演示")),
        Tab(child: Text("State演示")),
        Tab(
          child: Text("Change State演示"),
        )
      ]),
      Expanded(
        flex: 1,
        child: TabBarView(
          controller: _tabController,
          children: _tabItems(),
        ),
      )
    ]);
  }
}

class Box extends StatefulWidget {
  const Box({super.key, required this.color});

  final Color color;

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int _count = 0;

  void run() {
    print("running in _boxState");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        color: widget.color,
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(0),
            side: MaterialStateProperty.all(BorderSide.none),
            backgroundColor: MaterialStateProperty.all(widget.color),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0), // 设置为0以创建矩形形状
              ),
            ),
          ),
          onPressed: () {
            setState(() => _count++);
          },
          child: Text("$_count", style: const TextStyle(fontSize: 30)),
        ));
  }
}

class ChangeState extends StatefulWidget {
  const ChangeState({super.key});

  @override
  State<ChangeState> createState() => _ChangeStateState();
}

class _ChangeStateState extends State<ChangeState> {
  final GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          var boxState = _globalKey.currentState as _BoxState;
          setState(() => boxState._count++);
          boxState.run();

          var boxWidge = _globalKey.currentWidget as Box;
          print(boxWidge.color);

          var renderBox =
              _globalKey.currentContext!.findRenderObject() as RenderBox;
          print(renderBox.size);
        },
      ),
      body: Center(child: Box(key: _globalKey, color: Colors.red)),
    );
  }
}
