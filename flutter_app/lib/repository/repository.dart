import 'package:practice3/model/status.dart';
import 'package:practice3/model/task.dart';
import 'package:practice3/service/task_api_client.dart';

class Repository {
  final TaskApiClient api = TaskApiClient();

  // タスクリストを取得するメソッド
  Future<List<TaskList>?> fetchList() async {
    return await api.fetchList();
  }

  // 特定のタスクを取得するメソッド
  Future<TaskList?> fetchItem(String id) async {
    return await api.fetchItem(id);
  }

  // 新しいタスクを追加するメソッド
  Future<void> postTodo(String task, String description, Status status) async {
    await api.postTodo(task, description, status);
  }

  // タスクを更新するメソッド
  Future<void> updateTodo(
      String id, // タスクID
      String task,
      String description,
      Status status) async {
    await api.updateTodo(id, task, description, status); // IDを渡してサーバー上で更新
  }

  // タスクを削除するメソッド
  Future<void> deleteTodo(String id) async {
    await api.deleteTodo(id);
  }
}
