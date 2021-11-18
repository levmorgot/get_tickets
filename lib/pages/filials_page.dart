import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_tickets/block/filial_bloc.dart';
import 'package:get_tickets/services/filial_repository.dart';
import 'package:get_tickets/wigits/filials_list.dart';
import 'package:get_tickets/wigits/search_panel.dart';

class FilialsPage extends StatelessWidget {
  final FilialsRepository filialsRepository = FilialsRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FilialBloc>(
      create: (context) => FilialBloc(filialsRepository),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Список больниц'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SearchPanel(),
            Expanded(
              child: FilialsList(),
            ),
          ],
        ),
      ),
    );
  }
}
