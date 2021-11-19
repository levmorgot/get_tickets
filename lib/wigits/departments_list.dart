import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_tickets/block/department/department_bloc.dart';
import 'package:get_tickets/block/department/department_state.dart';

class DepartmentsList extends StatelessWidget {

  const DepartmentsList({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentBloc, DepartmentState>(
        builder: (context, state) {
          if (state is DepartmentEmptyState){
            return Center(
              child: Text('Нет данных, попробуйте изменить параметры поиска'),
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
              itemBuilder: (context, index) => Container(
                color: index % 2 == 1 ? Colors.white : Colors.lightBlueAccent,
                child: ListTile(
                  title: Column(
                    children: <Widget>[
                      Text(
                        '${state.loadedDepartment[index].name}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            '${state.loadedDepartment[index].groupName}',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
        }
    );

  }
}
