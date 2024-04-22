import 'package:flutter/material.dart';

class Place extends StatefulWidget {
  const Place({super.key});

  @override
  State<Place> createState() => _PlaceState();
}

class _PlaceState extends State<Place> with TickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _items = ["第一条数据", "第二条数据"];
  final GlobalKey<AnimatedListState> _globalKey =
      GlobalKey<AnimatedListState>(debugLabel: "4");

  bool _implicitAnimationFlag = true;

  static const String _url =
      'https://pic3.zhimg.com/v2-d1f733345b0d11ea4d1bde0e2511dbc8_720w.jpg?source=172ae18b';

  static const String _url2 =
      'https://tse2-mm.cn.bing.net/th/id/OIP-C.hFli75hOP5QJ9GktSc5CQwAAAA?rs=1&pid=ImgDetMain';

  late AnimationController _rotateController;

  Widget _buildItem(index) {
    return ListTile(
      title: Text(_items[index]),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          // due to remove animation, user can tap on the same item multiple times
          if (index >= _items.length) {
            return;
          }

          var item = _buildItem(index);
          _items.removeAt(index);

          _globalKey.currentState!.removeItem(
            index,
            (context, animation) {
              return ScaleTransition(
                scale: animation,
                child: item,
              );
            },
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);

    _rotateController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat(reverse: true);

    _rotateController.addListener(
      () {
        // print(_rotateController.value);
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TabBar(controller: _tabController, tabs: const [
        Tab(child: Text("ListView动画")),
        Tab(child: Text("隐式动画")),
        Tab(child: Text("显示动画")),
        Tab(child: Text("Hero动画")),
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

  List<Widget> _tabItems() {
    return [
      Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: UniqueKey(),
          child: const Icon(Icons.add),
          onPressed: () {
            _items.add("新数据${_items.length + 1}");
            _globalKey.currentState!.insertItem(_items.length - 1);
          },
        ),
        body: AnimatedList(
          key: _globalKey,
          initialItemCount: _items.length,
          itemBuilder: (context, index, animation) {
            return FadeTransition(
              opacity: animation,
              child: _buildItem(index),
            );
          },
        ),
      ),
      Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: UniqueKey(),
          child: const Icon(Icons.change_history),
          onPressed: () {
            setState(() => _implicitAnimationFlag = !_implicitAnimationFlag);
          },
        ),
        body: Stack(
          children: [
            Positioned(
              top: 50,
              left: 50,
              child: AnimatedContainer(
                width: _implicitAnimationFlag ? 80 : 150,
                height: _implicitAnimationFlag ? 50 : 100,
                color: Colors.black,
                duration: const Duration(seconds: 1),
                transform: _implicitAnimationFlag
                    ? Matrix4.translationValues(0, 0, 0)
                    : Matrix4.translationValues(100, 0, 0),
                child: Center(
                  child: AnimatedDefaultTextStyle(
                    curve: Curves.easeInSine,
                    duration: const Duration(seconds: 1),
                    style:
                        TextStyle(fontSize: _implicitAnimationFlag ? 10 : 20),
                    child: const Text(
                      "你好Flutter",
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 200,
              child: AnimatedPadding(
                padding: _implicitAnimationFlag
                    ? const EdgeInsets.all(0)
                    : const EdgeInsets.all(100),
                duration: const Duration(seconds: 1),
                curve: Curves.bounceOut,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 300,
              child: AnimatedOpacity(
                opacity: _implicitAnimationFlag ? 0.2 : 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeIn,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                ),
              ),
            ),
            AnimatedPositioned(
              left: 150,
              top: _implicitAnimationFlag ? 10 : 100,
              duration: const Duration(seconds: 1),
              curve: Curves.easeIn,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
            ),
            Positioned(
              top: 200,
              left: 10,
              child: AnimatedSwitcher(
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                      scale: animation,
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ));
                },
                duration: const Duration(seconds: 1),
                child: _implicitAnimationFlag
                    ? Container(
                        width: 50,
                        height: 50,
                        color: Colors.green,
                        child: Center(
                          child: Text(
                              key: UniqueKey(),
                              _implicitAnimationFlag ? "Flutter" : "你好"),
                        ),
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
            Positioned(
              top: 200,
              left: 70,
              child: AnimatedSwitcher(
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                duration: const Duration(seconds: 1),
                child: Container(
                  key: UniqueKey(),
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                  child: Center(
                    child: Text(_implicitAnimationFlag ? "Flutter" : "你好"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Scaffold(
          floatingActionButton: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  child: const Text("开始"),
                  onPressed: () {
                    _rotateController.forward();
                  },
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  child: const Text("重复"),
                  onPressed: () {
                    _rotateController.repeat();
                  },
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  child: const Text("反向"),
                  onPressed: () {
                    _rotateController.reverse();
                  },
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  child: const Text("停止"),
                  onPressed: () {
                    _rotateController.stop();
                  },
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  child: const Text("重置"),
                  onPressed: () {
                    _rotateController.reset();
                  },
                ),
              ],
            ),
          ),
          body: Stack(
            children: [
              Positioned(
                top: 100,
                left: 100,
                child: RotationTransition(
                  turns: _rotateController,
                  child: const FlutterLogo(size: 60),
                ),
              ),
              Positioned(
                top: 100,
                left: 200,
                child: FadeTransition(
                  opacity: _rotateController,
                  child: const FlutterLogo(size: 60),
                ),
              ),
              Positioned(
                top: 100,
                left: 300,
                child: ScaleTransition(
                  scale: _rotateController.drive(
                    Tween(begin: 0.5, end: 1.2),
                  ),
                  child: const FlutterLogo(size: 60),
                ),
              ),
              Positioned(
                top: 200,
                left: 50,
                child: SlideTransition(
                  position: _rotateController.drive(
                    Tween(
                      begin: const Offset(0, 0),
                      end: const Offset(1, 0),
                    ),
                  ),
                  child: Container(
                    color: Colors.red,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Positioned(
                top: 200,
                left: 200,
                child: SlideTransition(
                  position: Tween(
                    begin: const Offset(0.0, 0.0),
                    end: const Offset(2.0, 0.0), // width * 2.0
                  )
                      .chain(
                        CurveTween(curve: Curves.bounceOut),
                      )
                      .chain(
                        CurveTween(
                            // start_time * 0.2, end_time * 0.8
                            curve: const Interval(0.2, 0.8)),
                      )
                      .animate(_rotateController),
                  child: Container(
                    color: Colors.blue,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
              Positioned(
                top: 300,
                left: 50,
                child: AnimatedIcon(
                  size: 50,
                  icon: AnimatedIcons.home_menu,
                  progress: CurveTween(curve: const Interval(0.4, 0.8))
                      .animate(_rotateController),
                ),
              ),
              Positioned(
                top: 300,
                left: 150,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                      child: Stack(
                    children: [
                      ScaleTransition(
                        scale: _rotateController.drive(
                          Tween(begin: 0.0, end: 1.0).chain(
                            CurveTween(curve: const Interval(0.3, 0.7)),
                          ),
                        ),
                        child: const Icon(Icons.search, size: 40),
                      ),
                      ScaleTransition(
                        scale: _rotateController.drive(
                          Tween(begin: 1.0, end: 0.0).chain(
                            CurveTween(curve: const Interval(0.3, 0.6)),
                          ),
                        ),
                        child: const Icon(Icons.close, size: 40),
                      ),
                    ],
                  )),
                ),
              ),
            ],
          )),
      Stack(
        children: [
          Positioned(
            left: 20,
            top: 20,
            child: SizedBox(
              width: 100,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/hero",
                    arguments: {"src": _url},
                  );
                },
                child: Hero(
                  tag: "1",
                  child: Image.network(_url, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Positioned(
            left: 150,
            top: 20,
            child: SizedBox(
              width: 100,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/hero2",
                    arguments: {"src": _url2},
                  );
                },
                child: Hero(
                  tag: 2,
                  child: Image.network(_url2, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 200,
            child: SizedBox(
              width: 100,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/hero3",
                    arguments: {
                      "src": [_url, _url2]
                    },
                  );
                },
                child: Hero(
                  tag: 3,
                  child: Image.network(_url2, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ],
      )
    ];
  }
}
