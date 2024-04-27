import 'package:flutter/material.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:file_picker/file_picker.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import '../controllers/counter.dart';
import '../tools/utils.dart';
import 'image_pick.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> with TickerProviderStateMixin {
  late TabController _tabController;
  final RxInt _count = 0.obs; // used for local refresh ui
  final RxList _list = ["张三", "李四"].obs;

  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  CounterController counterController = Get.put(CounterController());

  final TextEditingController _controllerName = TextEditingController(
    text: "mike",
  );

  final TextEditingController _controllerPasswd = TextEditingController();

  FocusNode focusNodeName = FocusNode();
  FocusNode focusNodePasswd = FocusNode();
  FocusNode focusNodeLogin = FocusNode();

  final RxDouble dx = .0.obs, dy = .0.obs;

  Future<File> _getLocalDocumentFile(String filename) async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$filename');
  }

  Future<File> _getLocalTemporaryFile(String filename) async {
    final dir = await getApplicationCacheDirectory();
    return File('${dir.path}/$filename');
  }

  Future<File> _getLocalSupportFile(String filename) async {
    final dir = await getApplicationSupportDirectory();
    return File('${dir.path}/$filename');
  }

  Future<File> _getLocalLibraryFile(String filename) async {
    final dir = await getLibraryDirectory();
    return File('${dir.path}/$filename');
  }

  Future<File> _getLocalDowloadFile(String filename) async {
    final dir = await getLibraryDirectory();
    return File('${dir.path}filename');
  }

  Future<void> writeString(String str) async {
    try {
      final file = await _getLocalDocumentFile("flutter-test.dat");
      await file.writeAsString(str);
      print(file.path);
    } catch (e) {
      print(e);
    }

    try {
      final file = await _getLocalLibraryFile("flutter-test.dat");
      print(file.path);
    } catch (e) {
      print(e);
    }

    try {
      final file = await _getLocalDowloadFile("flutter-test.dat");
      print(file.path);
    } catch (e) {
      print(e);
    }

    try {
      final dirs = await getExternalStorageDirectories();
      print(dirs);
    } catch (e) {
      print(e);
    }

    try {
      final file2 = await _getLocalTemporaryFile("flutter-test.dat");
      await file2.writeAsString(str);
      print(file2.path);
    } catch (e) {
      print(e);
    }

    try {
      final file3 = await _getLocalSupportFile("flutter-test.dat");
      await file3.writeAsString(str);
      print(file3.path);
    } catch (e) {
      print(e);
    }
  }

  Future<void> readFile() async {
    try {
      final file = await _getLocalDocumentFile("flutter-test.dat");
      print(await file.readAsString());
    } catch (e) {
      print(e);
    }

    try {
      final file2 = await _getLocalTemporaryFile("flutter-test.dat");
      print(await file2.readAsString());
    } catch (e) {
      print(e);
    }

    try {
      final file3 = await _getLocalSupportFile("flutter-test.dat");
      print(await file3.readAsString());
    } catch (e) {
      print(e);
    }
  }

  Future<String> getRometeJson() async {
    const url = "https://heng30.xyz/apisvr/cryptocurrency/latest";
    http.Response res = await http.Client().get(Uri.parse(url));
    return res.body;
  }

  Future<String> getRometeJsonV2() async {
    const url = "https://heng30.xyz/apisvr/cryptocurrency/latest";
    dio.Response<String> res = await dio.Dio().get(url);
    return res.data!;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _controllerName.dispose();
    _controllerPasswd.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TabBar(controller: _tabController, tabs: const [
        Tab(child: Text("Get共享状态")),
        Tab(child: Text("输入组件")),
        Tab(child: Text("系统IO")),
        Tab(child: Text("SliverAppBar")),
        Tab(child: Text("CurveNavigationBar")),
      ]),
      Expanded(
        flex: 1,
        child: TabBarView(
          controller: _tabController,
          children: _tabItems(context),
        ),
      )
    ]);
  }

  List<Widget> _tabItems(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final FocusScopeNode focusScpoeNode = FocusScope.of(context);

    final mc = Utils.str2MaterialColor("0274bc");

    return [
      Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: UniqueKey(),
          child: const Icon(Icons.add),
          onPressed: () {
            _count.value++;
            _list.add("王五-$_count");
            counterController.inc();
          },
        ),
        body: Container(
          color: Colors.white10,
          child: Stack(
            children: [
              Positioned(
                top: 320,
                width: 200,
                height: 200,
                child: Obx(
                  () {
                    return ListView(
                        children: _list.map((v) {
                      return ListTile(title: Text(v));
                    }).toList());
                  },
                ),
              ),
              Positioned(
                top: 320,
                width: 200,
                height: 200,
                right: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("测试".tr),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        var local = Locale('zh', 'CN');
                        Get.updateLocale(local);
                      },
                      child: const Text("中文"),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        var local = Locale('en', 'US');
                        Get.updateLocale(local);
                      },
                      child: const Text("英文"),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        var local = Locale('jp', 'JP');
                        Get.updateLocale(local);
                      },
                      child: const Text("日文"),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 100,
                width: 200,
                height: 200,
                child: Container(
                  color: Colors.red,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        width: 100,
                        height: 100,
                        right: 30,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.pink,
                          child: Obx(
                            () => Text(
                              "$_count",
                              style: const TextStyle(fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 100,
                right: 0,
                width: 100,
                height: 100,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: Obx(
                    () => Text(
                      "${counterController.counter}",
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                width: size.width,
                height: 50,
                child: Container(
                  color: Colors.green,
                  child: const Align(
                    child: Text(
                      "你好Flutter",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 550,
                width: size.width,
                child: Column(
                  children: [
                    for (int i = 0; i < 10; i++)
                      Container(
                        height: 30,
                        color: i == 0 ? mc[50] : mc[i * 100],
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: _controllerName,
                focusNode: focusNodeName,
                autofocus: true,
                onSubmitted: (v) {
                  focusScpoeNode.requestFocus(focusNodePasswd);
                },
                decoration: const InputDecoration(
                  labelText: "用户名",
                  hintText: "请输入名称",
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: Icon(Icons.edit),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _controllerPasswd,
                focusNode: focusNodePasswd,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "密码",
                  hintText: "请输入密码",
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: Icon(Icons.edit),
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (v) {
                  focusScpoeNode.requestFocus(focusNodeName);
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                focusNode: focusNodeLogin,
                onPressed: () {
                  print(_controllerName.text);
                  print(_controllerPasswd.text);
                  focusScpoeNode.requestFocus(focusNodeLogin);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                icon: const Icon(Icons.login),
                label: const Text("登陆"),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                ),
                onTap: () {
                  print("on tap");
                },
                onDoubleTap: () {
                  print("on double tap");
                },
                onLongPress: () {
                  print("on long pressed");
                },
                onPanDown: (e) {
                  print("down: ${e.globalPosition}");
                },
                onPanUpdate: (e) {
                  print("update ${e.globalPosition}");
                  dx.value = double.parse(e.delta.dx.toStringAsFixed(2));
                  dy.value = double.parse(e.delta.dy.toStringAsFixed(2));
                },
                onPanEnd: (e) {
                  print("pan end: ${e.velocity}");
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () {
                  return Text(
                    "$dx, $dy",
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
              const SizedBox(height: 20),
              InkWell(
                splashColor: Colors.blue,
                highlightColor: Colors.yellow,
                hoverColor: Colors.brown,
                onTap: () {
                  print("on tap");
                },
                onDoubleTap: () {
                  print("on double tap");
                },
                onLongPress: () {
                  print("on long pressed");
                },
                child: Container(
                  width: 200,
                  height: 200,
                  alignment: Alignment.center,
                  child: Text(
                    "水波纹理效果",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  await writeString("hello world");
                },
                child: const Text("保存文件"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  await readFile();
                },
                child: const Text("读取文件"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  var data = await getRometeJson();
                  Map m = json.decode(data);
                  for (var k in m.keys) {
                    print(k);
                  }
                },
                child: const Text("Http Get"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  var data = await getRometeJsonV2();
                  Map m = json.decode(data);
                  print(json.encode(m));
                },
                child: const Text("Dio Http Get"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  if (Platform.isAndroid) {
                    AndroidIntent intent = const AndroidIntent(
                      action: 'action_view',
                      data: 'https://baidu.com',
                    );
                    await intent.launch();
                  } else {
                    Get.snackbar("提示信息", "仅支持Android平台",
                        snackPosition: SnackPosition.BOTTOM);
                  }
                },
                child: const Text("打开浏览器"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                  if (result != null) {
                    File file = File(result.files.single.path!);
                    print(await file.readAsString());
                  }
                },
                child: const Text("打开文件夹"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                  if (result != null) {
                    Uint8List? fileBytes = result.files.first.bytes;
                    String fileName = result.files.first.name;
                    print(fileBytes?.lengthInBytes);
                    print(fileName);
                  }
                },
                child: const Text("上传文件"),
              ),
              const SizedBox(height: 10),
              const Column(
                children: [
                  SizedBox(
                    width: 500,
                    height: 500,
                    child: MyImagePick(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.deepOrange[100],
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.pink,
              leading: const Icon(Icons.menu),
              expandedHeight: 350,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Container(color: Colors.red),
                title: const Text("Flexible Space"),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.deepOrange[300],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.deepOrange[300],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.deepOrange[300],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: const <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.call_split, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.pink,
          buttonBackgroundColor: Colors.green[300],
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 400),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_page.toString(),
                    textScaler: const TextScaler.linear(10.0)),
                ElevatedButton(
                  child: const Text('Go To Page of index 1'),
                  onPressed: () {
                    final CurvedNavigationBarState? navBarState =
                        _bottomNavigationKey.currentState;
                    navBarState?.setPage(1);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    ];
  }
}
