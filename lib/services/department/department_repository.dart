import 'package:get_tickets/models/department.dart';
import 'package:get_tickets/services/department/department_api_provider.dart';

class DepartmentsRepository {
  DepartmentProvider _departmentsProvider = DepartmentProvider();

  Future<List<Department>> getAllDepartments(int id, int cashId) =>
      _departmentsProvider.getDepartment(id, cashId);

  List<Department> searchDepartments(String searchString) =>
      _departmentsProvider.searchDepartment(searchString);
}
