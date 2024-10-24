import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('プロフィール'),
      ),
      body: const Center(
        child: Text('プロフィール画面', style: TextStyle(fontSize: 32.0)),
      ),
    );
  }
}
