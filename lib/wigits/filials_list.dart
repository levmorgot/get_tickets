import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_tickets/block/filial_bloc.dart';
import 'package:get_tickets/block/filial_state.dart';

class FilialsList extends StatelessWidget {
  const FilialsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilialBloc, FilialState>(
        builder: (context, state) {
          if (state is FilialEmptyState){
            return Center(
              child: Text('Нет данных, нажми Обновить'),
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
              itemBuilder: (context, index) => Container(
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
          if (state is FilialErrorState) {
            return Center(
              child: Text('Ошибка загрузки. Попробуйте снова!'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }
    );

  }
}
