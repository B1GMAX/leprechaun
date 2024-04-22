import 'dart:async';

import 'package:get/get.dart';
import 'package:leprechaun/core/api_services/api_service.dart';
import 'package:leprechaun/core/models/leader_model.dart';

class LeadersController extends GetxController {
  final _apiService = ApiService();

  String remainingTime = '';

  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
    _getLeaders();
  }

  _startTimer() {
    final targetTime =
        DateTime.now().add(const Duration(days: 3, hours: 16, minutes: 10));

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final currentTime = DateTime.now();
      final difference = targetTime.difference(currentTime);

      if (difference.inSeconds <= 0) {
        timer.cancel();
        remainingTime = 'Time\'s up!';
      } else {
        final days = difference.inDays.toString().padLeft(2, '0');
        final hours =
            difference.inHours.remainder(24).toString().padLeft(2, '0');
        final minutes =
            difference.inMinutes.remainder(60).toString().padLeft(2, '0');
        remainingTime = '$days d $hours h $minutes m';
      }
      update();
    });
  }

  final List<LeaderModel> leaders = <LeaderModel>[];

  int selectedLeaderIndex = 0;

  bool isLoading = true;

  Future<void> _getLeaders() async {
    leaders.addAll(await _apiService.getLeaders());
    isLoading = false;
    update();
  }

  void updateSelectedLeaderIndex(int index) {
    selectedLeaderIndex = index;
    update();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }
}
