import 'dart:convert';

import 'package:learn_getx/app/data/models/employe_model.dart';
import 'package:get/get.dart';
import 'package:learn_getx/app/providers/api.dart';
import 'package:http/http.dart' as http;

class EmployeController extends GetxController {
  final _getConnect = GetConnect();
  var employeeList = <Employee>[].obs;

  Future<void> fetchData() async {
    try {
      var apiUrl = '${Api.baseUrl}/api/v1/employe';
      var headers = await Api.getHeaders();

      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        // Check if 'data' field is not null and is Iterable
        if (jsonResponse['rows'] != null && jsonResponse['rows'] is Iterable) {
          Iterable data = jsonResponse['rows'];
          employeeList.assignAll(data.map((model) => Employee.fromJson(model)));
        } else {
          throw Exception('Data field in the response is null or not iterable');
        }
      } else {
        throw Exception('Failed to load employe');
      }
    } catch (e) {
      print('Error during fetching employe: $e');
    }
  }

  // Add a new employee to the list
  void addEmployee({
    required String employeName,
    required String employeRole,
    required String employePhoneNumber,
    // required String employeAddress,
  }) {
    // Create a new Employee instance
    var newEmployee = Employee(
      id: 0, // set the ID to 0 or any default value
      employeName: employeName,
      employeRole: employeRole,
      employePhoneNumber: employePhoneNumber,
      // employeAddress: employeAddress,
    );

    // Add the new employee to the list
    employeeList.add(newEmployee);

  }

  // Add employee data to the server (you can customize this based on your API)
  Future<void> _addEmployeeToServer(Employee newEmployee) async {
    try {
      var apiUrl = '${Api.baseUrl}/api/v1/employe';
      var headers = await Api.getHeaders();

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: json.encode(newEmployee.toJson()),
      );

      if (response.statusCode == 201) {
        print('Employee added to the server successfully');
      } else {
        print('Failed to add employee to the server');
      }
    } catch (e) {
      print('Error during adding employee to the server: $e');
    }
  }

  // // edit
  // void setSelectedEmployee(Employee employee) {
  //   selectedEmployee.value = employee;
  // }

  // void updateEmployee({
  //   required int employeId,
  //   required String employeName,
  //   required String employeRole,
  //   required String employePhoneNumber,
  //   required String employeAddress,
  // }) {
  //   try {
  //     // Update data karyawan di sini (Anda perlu menyesuaikan dengan API endpoint yang sesuai)
  //     // ...

  //     // Setelah berhasil diupdate, fetch ulang data karyawan
  //     fetchData();
  //   } catch (e) {
  //     print('Error during updating employe: $e');
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}