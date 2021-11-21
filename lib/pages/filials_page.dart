import 'package:flutter/material.dart';
import 'package:get_tickets/services/filial/filial_repository.dart';
import 'package:get_tickets/widgets/filials_list.dart';
import 'package:get_tickets/widgets/filial_search_delegate.dart';

class FilialsPage extends StatelessWidget {
  final FilialsRepository filialsRepository = FilialsRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Список больниц'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: FilialsList(),
            ),
          ],
        ),
      );

  }
}
