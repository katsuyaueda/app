import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice3/model/status.dart';
import 'package:practice3/model/task.dart';
import 'package:practice3/state/task_name.dart';

class StatusBox extends HookConsumerWidget {
  final String taskId; // タスクIDを受け取る
  final Status initialStatus; // 初期ステータスを受け取る

  const StatusBox({
    super.key,
    required this.taskId,
    this.initialStatus = Status.todo, // デフォルト値を設定
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskListAsyncValue = ref.watch(listNotifierProvider);

    return taskListAsyncValue.when(
      data: (taskList) {
        final task = taskList.firstWhere(
          (task) => task.id == taskId,
          orElse: () => TaskList(
              id: '', task: '', description: '', status: initialStatus),
        );

        // ステータスを取得し、表示を更新
        final status = task.status;

        final color = switch (status) {
          Status.todo => Colors.red,
          Status.doing => Colors.orange,
          Status.done => Colors.green,
          null => Colors.grey,
        };

        final statusState = switch (status) {
          Status.todo => '未着手',
          Status.doing => '着手中',
          Status.done => '完了',
          null => 'ステータス不明',
        };

        return Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            statusState,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        );
      },
      loading: () =>
          const Center(child: CircularProgressIndicator()), // 読み込み中のインジケーター
      error: (error, stack) => Text('エラーが発生しました: $error'), // エラー表示
    );
  }
}
