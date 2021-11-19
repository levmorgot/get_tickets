import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_tickets/block/filial_bloc.dart';
import 'package:get_tickets/block/filial_event.dart';

class SearchPanel extends StatelessWidget {
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
    final FilialBloc filialBloc = BlocProvider.of<FilialBloc>(context);
    filialBloc.add(FilialLoadEvent());
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
              filialBloc.add(FilialSearchEvent(textFieldController.text));
            },
            style: raisedButtonStyle,
          )
        ],
      ),
    );
  }
}
