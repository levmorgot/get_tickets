import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_tickets/block/filial/filial_bloc.dart';
import 'package:get_tickets/pages/filials_page.dart';
import 'package:get_tickets/services/filial/filial_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FilialsRepository filialsRepository = FilialsRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FilialBloc>(
          create: (context) => FilialBloc(filialsRepository)..firstLoading(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FilialsPage();
  }
}
