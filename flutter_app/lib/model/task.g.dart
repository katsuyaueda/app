// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskListImpl _$$TaskListImplFromJson(Map<String, dynamic> json) =>
    _$TaskListImpl(
      id: json['id'] as String?,
      task: json['task'] as String?,
      description: json['description'] as String?,
      status: $enumDecodeNullable(_$StatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$TaskListImplToJson(_$TaskListImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'task': instance.task,
      'description': instance.description,
      'status': _$StatusEnumMap[instance.status],
    };

const _$StatusEnumMap = {
  Status.todo: 'todo',
  Status.doing: 'doing',
  Status.done: 'done',
};
