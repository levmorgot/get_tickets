import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_tickets/block/core/core_bloc.dart';
import 'package:get_tickets/block/department/department_event.dart';
import 'package:get_tickets/block/department/department_state.dart';
import 'package:get_tickets/models/department.dart';
import 'package:get_tickets/services/department/department_repository.dart';

class DepartmentBloc extends CoreBloc<DepartmentEvent, DepartmentState> {
  final DepartmentsRepository departmentsRepository;

  DepartmentBloc(this.departmentsRepository) : super(DepartmentEmptyState()) {
    on<DepartmentLoadEvent>((event, emit) async {
      emit(DepartmentLoadingState());
      try {
        final List<Department> _loadedDepartmentList =
            await departmentsRepository.getAllDepartments(
                event.filial.id, event.filial.cashId);
        if (_loadedDepartmentList.length > 0) {
          emit(DepartmentLoadedState(_loadedDepartmentList));
        } else {
          emit(DepartmentEmptyState());
        }
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
