import 'package:json_annotation/json_annotation.dart';

part 'leader_model.g.dart';

@JsonSerializable()
class LeaderModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;
  final String? name;

  LeaderModel({
    required this.id,
    required this.title,
    required this.completed,
    required this.userId,
    required this.name,
  });

  factory LeaderModel.fromJson(Map<String, dynamic> json) =>
      _$LeaderModelFromJson(json);

  LeaderModel copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
    String? name,
  }) {
    return LeaderModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
      name: name ?? this.name,
    );
  }
}
