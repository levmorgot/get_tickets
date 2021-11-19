import 'package:get_tickets/models/filial.dart';

abstract class DepartmentEvent {}

class DepartmentLoadEvent extends DepartmentEvent {
  Filial filial;

  DepartmentLoadEvent(this.filial);
}

class DepartmentSearchEvent extends DepartmentEvent {
  String searchString;

  DepartmentSearchEvent(this.searchString);
}
