import 'package:flutter_bloc/flutter_bloc.dart';

class CoreBloc<CoreEvent, CoreState> extends Bloc<CoreEvent, CoreState> {
  CoreBloc(initialState) : super(initialState);
}