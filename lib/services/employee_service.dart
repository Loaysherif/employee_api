// lib/services/employee_service.dart
import 'package:dio/dio.dart';
import 'package:employee_api/utils.dart';
import '../models/employee_model.dart';

class EmployeeService {
  final Dio _dio = Dio();

  Future<List<EmployeeModel>> fetchEmployees() async {
    try {
      final response = await _dio.get(
        'https://dummy.restapiexample.com/api/v1/employees',
      ); // API URL
      if (response.statusCode == 200) {
        List<EmployeeModel> employees =
            (response.data['data'] as List)
                .map((e) => EmployeeModel.fromJson(e))
                .toList();

        // Cache the employee list locally
        await Cache.saveEmployees(employees);

        return employees;
      } else {
        throw Exception('Failed to load employee data');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        // Rate-limiting detected (Too many requests)
        // Implement retry logic here
        print('Rate limit exceeded. Retrying...');
        await Future.delayed(Duration(seconds: 5));
        return fetchEmployees(); // Retry the request
      } else {
        throw Exception('Failed to load employee data: ${e.message}');
      }
    }
  }

  // Load employees from cache if network fails
  Future<List<EmployeeModel>> getEmployeesFromCache() async {
    return await Cache.loadEmployees();
  }
}
