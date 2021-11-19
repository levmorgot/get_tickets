import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_tickets/block/department/department_bloc.dart';
import 'package:get_tickets/models/filial.dart';
import 'package:get_tickets/services/department/department_repository.dart';
import 'package:get_tickets/wigits/departments_list.dart';
import 'package:get_tickets/wigits/search_department_panel.dart';

class DepartmentPage extends StatelessWidget {
  final DepartmentsRepository departmentsRepository = DepartmentsRepository();

  Filial filial;

  DepartmentPage(this.filial);


  @override
  Widget build(BuildContext context) {
    return BlocProvider<DepartmentBloc>(
      create: (context) => DepartmentBloc(departmentsRepository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('${filial.name}'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SearchDepartmentPanel(filial),
            Expanded(
              child: DepartmentsList(),
            ),
          ],
        ),
      ),
    );
  }
}
