import 'dart:convert';

import 'package:get_tickets/models/filial.dart';
import 'package:http/http.dart' as http;

class FilialProvider {
  List<Filial> _allFilials = [];
  Future<List<Filial>> getFilial() async {
    final response = await http.get(Uri.parse('https://registratura.volganet.ru/filial'));
    if (response.statusCode == 200) {
      final List<dynamic> filialJson = json.decode(response.body)['data'];
      filialJson.map((json) {
        _allFilials.add(Filial.fromJson(json));
      });
      return _allFilials;
    } else {
      throw Exception('Error fetching filials');
    }
  }
}