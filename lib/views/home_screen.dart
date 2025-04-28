import 'package:flutter/material.dart';
import '../models/employee_model.dart';
import '../services/employee_service.dart';

/// HomeScreen is the main screen that displays a button to fetch and list employees.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<EmployeeModel> employees = [];
  bool isLoading = false;

  // Fetch employee data and update the UI
  void getEmployees() async {
    setState(() {
      isLoading = true;
    });
    try {
      employees = await EmployeeService().fetchEmployees();
    } catch (e) {
      debugPrint(e.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee List')),
      body: Center(
        child:
            isLoading
                ? const CircularProgressIndicator()
                : employees.isEmpty
                ? ElevatedButton(
                  onPressed: getEmployees,
                  child: const Text('Fetch Employees'),
                )
                : ListView.builder(
                  itemCount: employees.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(employees[index].employeeName[0]),
                      ),
                      title: Text(employees[index].employeeName),
                      subtitle: Text(
                        'Salary: \$${employees[index].employeeSalary}',
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
