import 'package:get/get.dart';

class LeadersController extends GetxController {
  RxInt selectedLeaderIndex = 16.obs;

  void updateSelectedLeaderIndex(int index) {
    selectedLeaderIndex.value = index;
  }
}
