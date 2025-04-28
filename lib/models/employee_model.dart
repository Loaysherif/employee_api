// lib/models/employee_model.dart
class EmployeeModel {
  final int id;
  final String employeeName;
  final int employeeSalary;
  final int employeeAge;
  final String profileImage;

  EmployeeModel({
    required this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
    required this.profileImage,
  });

  // Convert JSON to EmployeeModel
  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      id: json['id'],
      employeeName: json['employee_name'],
      employeeSalary: json['employee_salary'],
      employeeAge: json['employee_age'],
      profileImage: json['profile_image'],
    );
  }

  // Convert EmployeeModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'employee_name': employeeName,
      'employee_salary': employeeSalary,
      'employee_age': employeeAge,
      'profile_image': profileImage,
    };
  }
}
