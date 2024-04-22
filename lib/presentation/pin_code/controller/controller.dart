import 'package:get/get.dart';
import 'package:leprechaun/consts.dart';
import 'package:leprechaun/core/firebase_services/firestore_service.dart';
import 'package:leprechaun/presentation/root/root_page.dart';

class PinCodeController extends GetxController {
  final fireStoreService = FireStoreService();
  RxString input = ''.obs;
  RxString savedPin = ''.obs;
  RxBool isCorrect = true.obs;

  PinCodeController() {
    getPin();
  }

  void onKeyPressed(String keyValue) {
    if (keyValue == bksp && input.isNotEmpty) {
      input.value = input.substring(0, input.value.length - 1);
    } else if (input.value.length < 4 && keyValue != bksp) {
      input.value += keyValue;
    }
  }

  void savePinCode() {
    if (savedPin.isEmpty) {
      fireStoreService.savePinCode(input.value);
      Get.to(() => const RootPage());
    }
  }

  void checkEnteredCode() {
    if(savedPin.isNotEmpty){
      if (input.value == savedPin.value) {
        Get.to(() => const RootPage());
        isCorrect.value = true;
      } else {
        isCorrect.value = false;
      }
    }
  }

  Future<void> getPin() async {
    savedPin.value = await fireStoreService.getPinCode();
  }
}
