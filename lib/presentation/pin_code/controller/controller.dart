import 'package:get/get.dart';
import 'package:leprechaun/core/firebase_services/firestore_service.dart';

class PinCodeController extends GetxController {
  final fireStoreService = FireStoreService();
  RxString input = ''.obs;

  void onKeyPressed(String keyValue) {
    if (keyValue == 'bksp' && input.isNotEmpty) {
      input.value = input.substring(0, input.value.length - 1);
    } else if (input.value.length < 4) {
      input.value += keyValue;
    }
  }

  void savePinCode() {
    fireStoreService.savePinCode(input.value);
  }
}
