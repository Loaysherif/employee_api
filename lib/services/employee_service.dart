import 'dart:convert';
import 'package:dio/dio.dart';
import '../models/employee_model.dart';

class EmployeeService {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://dummy.restapiexample.com/api/v1/employees';

  Future<List<EmployeeModel>> fetchEmployees() async {
    try {
      final response = await _dio.get(_baseUrl);
      if (response.statusCode == 200) {
        final List<dynamic> employeeList = jsonDecode(response.data)['data'];
        return employeeList.map((e) => EmployeeModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load employees');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}
