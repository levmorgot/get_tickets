import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_tickets/block/department/department_bloc.dart';
import 'package:get_tickets/block/department/department_event.dart';
import 'package:get_tickets/models/filial.dart';

class SearchDepartmentPanel extends StatelessWidget {

  Filial filial;

  SearchDepartmentPanel(this.filial);

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.blue,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );

  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final DepartmentBloc departmentBloc = BlocProvider.of<DepartmentBloc>(context);
    departmentBloc.add(DepartmentLoadEvent(filial));
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: textFieldController,
            ),
          ),
          TextButton(
            child: Text('Найти'),
            onPressed: () {
              departmentBloc.add(DepartmentSearchEvent(textFieldController.text));
            },
            style: raisedButtonStyle,
          )
        ],
      ),
    );
  }
}
