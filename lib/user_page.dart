// user_page.dart
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final Map<String, dynamic> userData;

  const UserPage({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("用户信息"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("姓名: ${userData['name'] ?? '未知'}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("邮箱: ${userData['email'] ?? '未知'}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("电话: ${userData['phone'] ?? '未知'}", style: TextStyle(fontSize: 18)),
            Text("原始数据: ${userData['args'] ?? '未知'}"),
            Text("IP 地址: ${userData['origin'] ?? '未知'}"),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // 返回上一页
              },
              child: Text("返回"),
            )
          ],
        ),
      ),
    );
  }
}