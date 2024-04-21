import 'package:get/get.dart';
import 'package:leprechaun/core/api_services/api_service.dart';
import 'package:leprechaun/core/models/leader_model.dart';

class LeadersController extends GetxController {
  final apiService = ApiService();

  LeadersController() {
    getLeaders();
  }

  final List<LeaderModel> leaders = <LeaderModel>[];

  int selectedLeaderIndex = 0;

  bool isLoading = false;

  Future<void> getLeaders() async {
    isLoading = true;
    leaders.addAll(await apiService.getLeaders());
    isLoading = false;
    update();
  }



  void updateSelectedLeaderIndex(int index) {
    selectedLeaderIndex = index;
    update();
  }
}
