import 'package:get_tickets/block/core/core_event.dart';
import 'package:get_tickets/models/filial.dart';

abstract class DepartmentEvent extends CoreEvent {}

class DepartmentLoadEvent extends DepartmentEvent {
  Filial filial;

  DepartmentLoadEvent(this.filial);
}

class DepartmentSearchEvent extends DepartmentEvent {
  String searchString;

  DepartmentSearchEvent(this.searchString);
}
