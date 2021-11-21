import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_tickets/block/department/department_bloc.dart';
import 'package:get_tickets/block/department/department_state.dart';
import 'package:get_tickets/widgets/department_item.dart';

class DepartmentsList extends StatelessWidget {
  const DepartmentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentBloc, DepartmentState>(
        builder: (context, state) {
      if (state is DepartmentEmptyState) {
        return Center(
          child: Text(
              'Нет данных! Вы можете попытаться снова, но скорее всего ваша поликлиника не подлючена к сервису.'),
        );
      }
      if (state is DepartmentLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is DepartmentLoadedState) {
        return ListView.builder(
          itemCount: state.loadedDepartment.length,
          itemBuilder: (context, index) => DepartmentItem(state, index),
        );
      }
      if (state is DepartmentErrorState) {
        return Center(
          child: Text('Ошибка загрузки. Попробуйте снова!'),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
