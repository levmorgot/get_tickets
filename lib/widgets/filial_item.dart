import 'package:flutter/material.dart';
import 'package:get_tickets/block/filial/filial_state.dart';
import 'package:get_tickets/pages/department_page.dart';

class FilialItem extends StatelessWidget {
  final FilialLoadedState state;
  final int index;

  FilialItem(this.state, this.index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, 
             MaterialPageRoute(builder: (context) => DepartmentPage(state.loadedFilial[index]))
             );
      },
      child: Container(
        color: index % 2 == 1 ? Colors.white : Colors.lightBlueAccent,
        child: ListTile(
          title: Column(
            children: <Widget>[
              Text(
                '${state.loadedFilial[index].name}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Column(
                children: <Widget>[
                  Text(
                    '${state.loadedFilial[index].address}',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  Text(
                    '${state.loadedFilial[index].phone}',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
