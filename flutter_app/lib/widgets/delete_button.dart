import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice3/state/task_name.dart';

class DeleteButton extends ConsumerWidget {
  final String oldId;
  final String oldTitle;
  final String oldDetail;

  const DeleteButton(this.oldId, this.oldTitle, this.oldDetail, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void deleteTodo() {
      final notifier = ref.read(listNotifierProvider.notifier);
      notifier.deleteState(oldId);
      context.pop();
    }

    return OutlinedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: const Text('よろしいですか'),
              actions: [
                TextButton(
                  onPressed: () => context.pop(),
                  child: const Text('キャンセル'),
                ),
                TextButton(
                    onPressed: () {
                      deleteTodo();
                    },
                    child: const Text('確定'))
              ],
            );
          },
        );
      },
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(80, 35), // ボタンのサイズ
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2), // 角の丸みを設定
        ),
      ),
      child: const Text('削除'),
    );
  }
}
