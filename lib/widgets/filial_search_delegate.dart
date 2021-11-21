import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_tickets/block/filial/filial_bloc.dart';
import 'package:get_tickets/block/filial/filial_event.dart';
import 'package:get_tickets/widgets/filials_list.dart';

class CustomSearchDelegate extends SearchDelegate {

  CustomSearchDelegate()
      : super(searchFieldLabel: 'Найти больницу');

  final _suggestions = [
    'Волгоградский',
    'Стоматология',
    'Амбулатория',
    'Мира',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        tooltip: 'Back',
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final FilialBloc filialBloc = BlocProvider.of<FilialBloc>(context);
    filialBloc.add(FilialSearchEvent(query));
    return FilialsList();
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length > 0) {
      return Container();
    }
    return ListView.separated(
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return Text(
            _suggestions[index],
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: _suggestions.length);
  }
}
