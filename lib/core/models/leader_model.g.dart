// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leader_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaderModel _$LeaderModelFromJson(Map<String, dynamic> json) => LeaderModel(
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
      userId: json['userId'] as int,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$LeaderModelToJson(LeaderModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
      'name': instance.name,
    };
