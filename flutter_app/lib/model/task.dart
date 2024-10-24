import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice3/model/status.dart';
part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class TaskList with _$TaskList {
  factory TaskList({
    String? id,
    String? task,
    String? description,
    Status? status,
  }) = _TaskList;

  factory TaskList.fromJson(Map<String, dynamic> json) =>
      _$TaskListFromJson(json);
}
