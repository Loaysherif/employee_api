// lib/utils/cache.dart
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/employee_model.dart';

class Cache {
  static const String employeesKey = 'employeesKey';

  static Future<void> saveEmployees(List<EmployeeModel> employees) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String employeeListJson = jsonEncode(
      employees.map((e) => e.toJson()).toList(),
    );
    await prefs.setString(employeesKey, employeeListJson);
  }

  static Future<List<EmployeeModel>> loadEmployees() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? employeeListJson = prefs.getString(employeesKey);
    if (employeeListJson != null) {
      List<dynamic> employeeList = jsonDecode(employeeListJson);
      return employeeList.map((e) => EmployeeModel.fromJson(e)).toList();
    }
    return [];
  }
}
