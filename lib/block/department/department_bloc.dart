import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_tickets/block/department/department_event.dart';
import 'package:get_tickets/block/department/department_state.dart';
import 'package:get_tickets/models/department.dart';
import 'package:get_tickets/services/department/department_repository.dart';

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  final DepartmentsRepository departmentsRepository;

  DepartmentBloc(this.departmentsRepository) : super(DepartmentEmptyState()) {
    on<DepartmentLoadEvent>((event, emit) async {
      emit(DepartmentLoadingState());
      try {
        final List<Department> _loadedDepartmentList =
            await departmentsRepository.getAllDepartments(event.filial.id, event.filial.cashId);
        emit(DepartmentLoadedState(_loadedDepartmentList));
      } catch (_) {
        emit(DepartmentErrorState());
      }
    });
    on<DepartmentSearchEvent>((event, emit) async {
      emit(DepartmentLoadingState());
      try {
        final List<Department> _loadedDepartmentList =
            await departmentsRepository.searchDepartments(event.searchString);
        emit(DepartmentLoadedState(_loadedDepartmentList));
      } catch (_) {
        emit(DepartmentErrorState());
      }
    });
  }
}
