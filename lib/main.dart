import 'package:flutter/material.dart';
import 'package:lesson_11/src/ui/auth/login_screen.dart';
import 'package:lesson_11/src/ui/main_screen/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token') ?? "";
  runApp(
    MyApp(token: token),
  );
}

class MyApp extends StatelessWidget {
  final String token;

  const MyApp({
    Key? key,
    required this.token,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: token != "" ? const MainScreen() : const LoginScreen(),
      // home: const MainScreen(),
    );
  }
}
