// main.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // 用于解析 JSON
import 'package:ft_mobile_agent_flutter/ft_mobile_agent_flutter.dart';


import 'user_page.dart'; // 导入新页面

void main() {
  runApp(const MyApp());
  //使用公网 DataWay
  FTMobileFlutter.sdkConfig(
    datawayUrl: "https://xxxxxx",
    cliToken:  "8b452bbc4b4449eda802f2f1b96818d3",
    debug:true,
    env: "local",
    serviceName: "lubao_flutter"
  );
   FTRUMManager().setConfig(
        androidAppId: "android_id", 
        iOSAppId: "ios_id",
        enableUserResource: true,
        enableNativeUserAction: true,
    );
    // Flutter 异常捕获
    FlutterError.onError = FTRUMManager().addFlutterError;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter HTTP 示例',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // 模拟请求用户数据
  Future<Map<String, dynamic>> fetchUser() async {
    final response = await http.get(
      Uri.parse('https://httpbin.org/get'),
    );

    if (response.statusCode == 200) {
      // 请求成功，返回 JSON 数据
      return json.decode(response.body);
    } else {
      // 请求失败，抛出异常
      throw Exception('Failed to load user');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("主页")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              // 1. 发起 HTTP 请求
              final userData = await fetchUser();

              // 2. 跳转到新页面，传入数据
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserPage(userData: userData),
                ),
              );
            } catch (e) {
              // 请求失败，弹出提示
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("请求失败: $e")),
              );
            }
          },
          child: const Text("获取数据并跳转"),
        ),
      ),
    );
  }
}
