import 'package:get_tickets/models/filial.dart';
import 'package:get_tickets/services/filial/filial_api_provider.dart';

class FilialsRepository {
  FilialProvider _filialsProvider = FilialProvider();

  Future<List<Filial>> getAllFilials() => _filialsProvider.getFilial();

  List<Filial> searchFilials(String searchString) =>
      _filialsProvider.searchFilial(searchString);
}
