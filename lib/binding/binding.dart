import 'package:get/get.dart';
import '../controllers/counter2.dart';

class AllControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounterController2());
  }
}
