// lib/screens/employee_list_screen.dart
import 'package:flutter/material.dart';
import '../models/employee_model.dart';
import '../services/employee_service.dart';
import 'employee_details_screen.dart';

class EmployeeListScreen extends StatefulWidget {
  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  late Future<List<EmployeeModel>> _employeeList;
  final EmployeeService _employeeService = EmployeeService();

  @override
  void initState() {
    super.initState();
    _employeeList = _employeeService.fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Employee List')),
      body: FutureBuilder<List<EmployeeModel>>(
        future: _employeeList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No employees found.'));
          } else {
            List<EmployeeModel> employees = snapshot.data!;
            return ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                final employee = employees[index];
                return ListTile(
                  title: Text(employee.employeeName),
                  subtitle: Text('Salary: \$${employee.employeeSalary}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                EmployeeDetailsScreen(employee: employee),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
