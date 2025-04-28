import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/employee_model.dart';

/// EmployeeService handles API calls related to Employee data.
class EmployeeService {
  final String _baseUrl = 'http://dummy.restapiexample.com/api/v1/employees';

  /// Fetch employees from the API and parse the response into a list of EmployeeModel.
  Future<List<EmployeeModel>> fetchEmployees() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      final List<dynamic> employeeList = decoded['data'];
      return employeeList.map((e) => EmployeeModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load employees');
    }
  }
}
