import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:practice3/model/task.dart';
import 'package:practice3/state/task_name.dart';
import 'package:practice3/widgets/delete_button.dart';
import 'package:practice3/widgets/status_box.dart';

class TodoWidget extends ConsumerWidget {
  final TaskList task;

  const TodoWidget(
    this.task, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiClient = ref.read(repositoryProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      child: Container(
        height: 164, // 高さを指定
        width: 300,
        padding: const EdgeInsets.symmetric(
          // ← 内側の余白を指定
          horizontal: 10,
          vertical: 8,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      task.task!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      task.description!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                StatusBox(taskId: task.id ?? 'default-id'),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height: 100,
                    child: TextButton(
                        onPressed: () {
                          context.goNamed(
                            'EditTodo',
                            extra: {
                              'id': task.id,
                              'title': task.task,
                              'detail': task.description,
                            },
                          );
                        },
                        child: Text('編集'))),
                Row(
                  children: [
                    DeleteButton(
                      task.id ?? '0', // デフォルト値 0
                      task.task ?? 'No task', // デフォルト値 'No task'
                      task.description ?? '', // デフォルト値 空の文字列
                    ),
                    OutlinedButton(
                      onPressed: () {
                        context.goNamed('EditTodo');
                      },
                      child: Text('詳細'),
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(50, 35), // ボタンのサイズ
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2), // 角の丸みを設定
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
