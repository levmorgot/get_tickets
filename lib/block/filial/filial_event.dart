import 'package:get_tickets/block/core/core_event.dart';

abstract class FilialEvent extends CoreEvent {}

class FilialLoadEvent extends FilialEvent {}

class FilialSearchEvent extends FilialEvent {
  String searchString;

  FilialSearchEvent(this.searchString);
}
