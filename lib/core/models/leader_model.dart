import 'package:json_annotation/json_annotation.dart';

part 'leader_model.g.dart';

@JsonSerializable()
class LeaderModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  LeaderModel({
    required this.id,
    required this.title,
    required this.completed,
    required this.userId,
  });

  factory LeaderModel.fromJson(Map<String, dynamic> json) =>
      _$LeaderModelFromJson(json);
}
