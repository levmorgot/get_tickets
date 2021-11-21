import 'package:get_tickets/block/core/core_state.dart';

abstract class DepartmentState extends CoreState {}

class DepartmentEmptyState extends DepartmentState {}

class DepartmentLoadingState extends DepartmentState {}

class DepartmentLoadedState extends DepartmentState {
  List<dynamic> loadedDepartment = [];

  DepartmentLoadedState(this.loadedDepartment);
}

class DepartmentErrorState extends DepartmentState {}
