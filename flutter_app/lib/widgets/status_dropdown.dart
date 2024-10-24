import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice3/model/status.dart';
import 'package:practice3/state/task_name.dart';

class StatusDropdown extends HookConsumerWidget {
  final String id; // タスクID

  const StatusDropdown({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // タスクリスト全体を取得（AsyncValueの状態を扱う）
    final asyncTaskList = ref.watch(listNotifierProvider);

    return asyncTaskList.when(
      data: (taskList) {
        // 指定されたIDに該当するタスクを取得、タスクが見つからなかった場合はnullを返す
        final task = taskList.firstWhereOrNull((task) => task.id == id);

        // タスクが見つからなかった場合は空のウィジェットを返す
        if (task == null) {
          return const SizedBox.shrink(); // タスクがない場合は何も表示しない
        }

        final selectedStatus = useState(task.status);

        return DropdownButton<Status>(
          items: Status.values.map((status) {
            return DropdownMenuItem<Status>(
              value: status,
              child: Text(
                status.label, // 各ステータスに対応するラベルを表示
                style: const TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          isExpanded: true,
          value: selectedStatus.value, // 選択されたステータスを表示
          onChanged: (Status? newValue) {
            // ステータスが変更された場合にのみ更新
            if (newValue != null && newValue != selectedStatus.value) {
              selectedStatus.value = newValue; // UIに選択されたステータスを反映

              // ステータスの更新を呼び出し
              // ref
              // .read(listNotifierProvider.notifier)
              // .updateStatus(id, newValue);
            }
          },
        );
      },
      loading: () => const CircularProgressIndicator(), // ローディング状態
      error: (err, stack) => Text('Error: $err'), // エラー状態
    );
  }
}
