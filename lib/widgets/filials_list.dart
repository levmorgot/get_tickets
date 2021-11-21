import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_tickets/block/filial/filial_bloc.dart';
import 'package:get_tickets/block/filial/filial_state.dart';
import 'package:get_tickets/widgets/filial_item.dart';

class FilialsList extends StatelessWidget {
  const FilialsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilialBloc, FilialState>(builder: (context, state) {
      if (state is FilialEmptyState) {
        return Center(
          child: Text('Нет данных, попробуйте изменить параметры поиска'),
        );
      }
      if (state is FilialLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is FilialLoadedState) {
        return ListView.builder(
          itemCount: state.loadedFilial.length,
          itemBuilder: (context, index) => FilialItem(state, index),
        );
      }
      if (state is FilialErrorState) {
        return Center(
          child: Text('Ошибка загрузки. Попробуйте снова!'),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
