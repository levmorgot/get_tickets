abstract class FilialEvent {}

class FilialLoadEvent extends FilialEvent {}

class FilialSearchEvent extends FilialEvent {
  String searchString;

  FilialSearchEvent(this.searchString);
}
