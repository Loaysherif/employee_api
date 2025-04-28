// lib/screens/employee_details_screen.dart
import 'package:flutter/material.dart';
import '../models/employee_model.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final EmployeeModel employee;

  const EmployeeDetailsScreen({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(employee.employeeName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${employee.employeeName}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Age: ${employee.employeeAge} years old',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Salary: \$${employee.employeeSalary}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            if (employee.profileImage.isNotEmpty)
              Image.network(employee.profileImage),
          ],
        ),
      ),
    );
  }
}
