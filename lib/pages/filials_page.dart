import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_tickets/block/filial/filial_bloc.dart';
import 'package:get_tickets/services/filial/filial_repository.dart';
import 'package:get_tickets/widgets/filials_list.dart';
import 'package:get_tickets/widgets/search_panel.dart';

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
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
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
