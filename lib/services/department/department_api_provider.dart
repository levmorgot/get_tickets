import 'dart:convert';

import 'package:get_tickets/models/department.dart';
import 'package:http/http.dart' as http;

class DepartmentProvider {
  List<Department> _allDepartments = [];

  Future<List<Department>> getDepartment(int id, int cashId) async {
    final response =
        await http.get(Uri.parse('https://registratura.volganet.ru/api/reservation/departments?f=${id}&s=${cashId}'));
    if (response.statusCode == 200) {
      final List<dynamic> filialJson = json.decode(response.body)['data'];
      for (final json in filialJson) {
        try {
          _allDepartments.add(Department.fromJson(json));
        } catch (_) {
          print('Error fetching filial ${json}');
        }
      }
      return _allDepartments;
    } else {
      throw Exception('Error fetching departments');
    }
  }

  List<Department> searchDepartment(String searchString) {
    print(searchString);
    var test = _allDepartments
        .where((department) =>
            department.name
                .toUpperCase()
                .contains(searchString.toUpperCase()) ||
            department.groupName
                .toUpperCase()
                .contains(searchString.toUpperCase()))
        .toList();
    print(test);
    return test;
  }
}
