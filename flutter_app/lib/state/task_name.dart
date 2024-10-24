import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice3/model/status.dart';
import 'package:practice3/model/task.dart';
import 'package:practice3/service/task_api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_name.g.dart';

@riverpod
TaskApiClient repository(RepositoryRef ref) => TaskApiClient();

@riverpod
class ListNotifier extends _$ListNotifier {
  @override
  Future<List<TaskList>> build() async {
    final apiClient = ref.read(repositoryProvider);

    final tasks = await apiClient.fetchList();
    return tasks ?? []; // fetchListがnullなら空リストを返す
  }

  Future<void> createState(
    String task,
    String description,
    Status status,
  ) async {
    final newTask = TaskList(
      task: task,
      description: description,
      status: status,
    );

    // サーバーに新しいタスクを追加
    final apiClient = ref.read(repositoryProvider);
    await apiClient.postTodo(task, description, status);

    // 状態を更新
    state = AsyncValue.data([...state.asData!.value, newTask]);
  }

  Future<void> updateState(String id, String newTitle, String newDetail) async {
    final apiClient = ref.read(repositoryProvider);

    // 現在の状態から該当のタスクを探し、ステータスを取得
    final currentTask = state.asData!.value.firstWhere((task) => task.id == id);
    final currentStatus = currentTask.status;

    // サーバー上でタスクを更新 (既存のステータスを渡す)
    await apiClient.updateTodo(id, newTitle, newDetail, currentStatus!);

    // 状態を更新
    state = AsyncValue.data([
      for (final task in state.asData!.value)
        if (task.id == id)
          task.copyWith(task: newTitle, description: newDetail)
        else
          task,
    ]);
  }

  Future<void> deleteState(String id) async {
    final apiClient = ref.read(repositoryProvider);

    // サーバーからタスクを削除
    await apiClient.deleteTodo(id);

    // 状態を更新
    state = AsyncValue.data(
        state.asData!.value.where((task) => task.id != id).toList());
  }
}
