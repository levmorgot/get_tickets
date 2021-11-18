abstract class FilialState {}

class FilialEmptyState extends FilialState {}

class FilialLoadingState extends FilialState {}

class FilialLoadedState extends FilialState {
  List<dynamic> loadedFilial = [];

  FilialLoadedState(this.loadedFilial);
}

class FilialErrorState extends FilialState {}
