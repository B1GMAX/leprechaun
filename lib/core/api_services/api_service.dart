import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:leprechaun/core/models/leader_model.dart';

class ApiService {
  final dio = Dio();

  Future<List<LeaderModel>> getLeaders() async {
    final List<LeaderModel> leaders = [];
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/todos');
    if (response.statusCode == 200) {
      final List list = response.data;
      for (final item in list) {
        leaders.add(LeaderModel.fromJson(item));
      }

      try {} catch (e) {
        Get.snackbar('Something went wrong!', 'Something went wrong!');
      }
    }
    return leaders;
  }
}
