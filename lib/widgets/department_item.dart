import 'package:flutter/material.dart';
import 'package:get_tickets/block/department/department_state.dart';

class DepartmentItem extends StatelessWidget {
  final DepartmentLoadedState state;
  final int index;

  DepartmentItem(this.state, this.index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: index % 2 == 1 ? Colors.white : Colors.lightBlueAccent,
        child: ListTile(
          title: Column(
            children: <Widget>[
              Text(
                '${state.loadedDepartment[index].name}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
