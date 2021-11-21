import 'package:get_tickets/block/core/core_state.dart';

abstract class FilialState extends CoreState {}

class FilialEmptyState extends FilialState {}

class FilialLoadingState extends FilialState {}

class FilialLoadedState extends FilialState {
  List<dynamic> loadedFilial = [];

  FilialLoadedState(this.loadedFilial);
}

class FilialErrorState extends FilialState {}
