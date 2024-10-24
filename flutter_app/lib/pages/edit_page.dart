import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice3/state/task_name.dart';
import 'package:practice3/widgets/status_dropdown.dart';

class EditTodo extends HookConsumerWidget {
  final String id;
  final String title;
  final String detail;
  EditTodo({
    required this.id,
    required this.title,
    required this.detail,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(listNotifierProvider);

    final titleController = useTextEditingController(text: title);
    final descriptionController = useTextEditingController(text: detail);

    void regist() {
      final notifier = ref.read(listNotifierProvider.notifier);
      notifier.updateState(
          id, titleController.text, descriptionController.text);
      context.goNamed('home');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク管理アプリ/編集'),
      ),
      body: Container(
        height: 450,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'タスク名',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: const Color.fromARGB(255, 222, 220, 220),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      controller: titleController,
                      style: const TextStyle(
                        color: Colors.black, // 文字の色を指定
                        fontSize: 17, // フォントサイズを指定
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none, // デフォルトのボーダーを削除
                        contentPadding: EdgeInsets.all(10), // 内側の余白を追加
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '詳細',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: const Color.fromARGB(255, 222, 220, 220),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      controller: descriptionController,
                      style: const TextStyle(
                        color: Colors.black, // 文字の色を指定
                        fontSize: 17, // フォントサイズを指定
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none, // デフォルトのボーダーを削除
                        contentPadding: EdgeInsets.all(10), // 内側の余白を追加
                        hintText: '詳細',
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ステータス',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: const Color.fromARGB(255, 222, 220, 220),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: StatusDropdown(
                        id: id,
                      )),
                ],
              ),
              OutlinedButton(
                onPressed: () {
                  regist();
                },
                child: Text('登録'),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(800, 40), // ボタンのサイズ
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2), // 角の丸みを設定
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
