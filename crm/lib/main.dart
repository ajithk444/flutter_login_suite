import 'package:flutter/material.dart';
import './ui/login.dart';
import './ui/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {'register': (context) => RegisterPage()},
      home: LoginPage(title: 'Login'),
      debugShowCheckedModeBanner: false,
    );
  }
}
