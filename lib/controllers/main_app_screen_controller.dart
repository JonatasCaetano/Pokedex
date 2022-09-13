import 'package:get/get.dart';

class MainAppScreenController extends GetxController {
  static MainAppScreenController get to => Get.find();

  int indexPage = 0;

  void updateIndexPage({required index}) {
    indexPage = index;
    update();
  }
}
