import 'dart:convert';

import 'package:get_tickets/models/filial.dart';
import 'package:http/http.dart' as http;

class FilialProvider {
  List<Filial> _allFilials = [];

  Future<List<Filial>> getFilial() async {
    final response =
        await http.get(Uri.parse('https://registratura.volganet.ru/filial'));
    if (response.statusCode == 200) {
      final List<dynamic> filialJson = json.decode(response.body)['data'];
      _allFilials = [];
      for (final json in filialJson) {
        try {
          _allFilials.add(Filial.fromJson(json));
        } catch (_) {
          print('Error fetching filial ${json}');
        }
      }
      return _allFilials;
    } else {
      throw Exception('Error fetching filials');
    }
  }

  List<Filial> searchFilial(String searchString) {
    print(searchString);
    var test = _allFilials
        .where((filial) =>
            filial.name.toUpperCase().contains(searchString.toUpperCase()) ||
            filial.address.toUpperCase().contains(searchString.toUpperCase()))
        .toList();
    print(test);
    return test;
  }
}
