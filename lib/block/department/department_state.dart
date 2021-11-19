abstract class DepartmentState {}

class DepartmentEmptyState extends DepartmentState {}

class DepartmentLoadingState extends DepartmentState {}

class DepartmentLoadedState extends DepartmentState {
  List<dynamic> loadedDepartment = [];

  DepartmentLoadedState(this.loadedDepartment);
}

class DepartmentErrorState extends DepartmentState {}
