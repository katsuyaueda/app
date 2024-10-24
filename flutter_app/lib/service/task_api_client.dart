import 'package:dio/dio.dart';
import 'package:practice3/model/status.dart';
import 'package:practice3/model/task.dart';

class TaskApiClient {
  Future<List<TaskList>?> fetchList() async {
    final dio = Dio();
    const url = 'http://localhost:3000/items';
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      try {
        final datas = response.data as List<dynamic>;
        final list = datas.map((e) => TaskList.fromJson(e)).toList();
        return list;
      } catch (e) {
        throw e;
      }
    }
  }

  Future<TaskList?> fetchItem(String id) async {
    final dio = Dio();
    final url = 'http://localhost:3000/items/$id';
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      try {
        final datas = response.data as dynamic;
        return TaskList.fromJson(datas);
      } catch (e) {
        throw e;
      }
    }
  }

  Future<void> postTodo(String task, String description, Status status) async {
    final dio = Dio();
    final url = 'http://localhost:3000/items';
    var payload = {
      "task": task,
      "description": description,
      "status": status.toString().split('.').last // Statusを文字列に変換
    };
    try {
      final response = await dio.post(url, data: payload); // PATCHリクエストに変更
      print('Task updated successfully: ${response.data}');
    } catch (e) {
      print('Error updating task: $e');
      rethrow;
    }
  }

  Future<void> deleteTodo(String id) async {
    final dio = Dio();
    final url = 'http://localhost:3000/items/$id';
    final response = await dio.delete(url);
  }

  Future<void> updateTodo(
    String id, // タスクID
    String task,
    String description,
    Status status,
  ) async {
    final dio = Dio();
    final url =
        'http://localhost:3000/items/$id/status'; // タスクIDとステータス用のエンドポイント

    // ステータスを文字列に変換して送信
    var payload = {
      "task": task,
      "description": description,
      "status": status.toString().split('.').last // Statusを文字列に変換
    };

    try {
      final response = await dio.patch(url, data: payload); // PATCHリクエストに変更
      print('Task updated successfully: ${response.data}');
    } catch (e) {
      print('Error updating task: $e');
      rethrow;
    }
  }
}
