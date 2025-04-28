// lib/main.dart
import 'package:employee_api/views/employee_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Employee App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: EmployeeListScreen(), // Set this as the home screen
    );
  }
}
