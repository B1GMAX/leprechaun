import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:leprechaun/core/models/leader_model.dart';

class ApiService {
  final _dio = Dio();

  Future<List<LeaderModel>> getLeaders() async {
    final List<LeaderModel> leaders = [];
    final response =
        await _dio.get('https://jsonplaceholder.typicode.com/todos');
    if (response.statusCode == 200) {
      try {
        final List list = response.data;
        for (final item in list) {
          leaders.add(LeaderModel.fromJson(item));
          _addName(leaders);
        }
      } catch (e) {
        Get.snackbar('Something went wrong!', 'Something went wrong!');
      }
    }
    return leaders;
  }

  void _addName(List<LeaderModel> leaders) {
    for (int i = 0; i < leaders.length; i++) {
      leaders[i] = leaders[i].copyWith(name: i.isOdd ? 'Anna' : 'Kate');
    }
  }
}
