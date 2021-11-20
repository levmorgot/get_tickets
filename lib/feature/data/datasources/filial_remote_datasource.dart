import 'dart:convert';

import 'package:get_tickets/core/error/exception.dart';
import 'package:get_tickets/feature/data/models/filial_model.dart';
import 'package:http/http.dart' as http;

abstract class FilialRemoteDataSource {
  Future<List<FilialModel>> getAllFilials();

  List<FilialModel> searchFilial(String query);
}


class FilialRemoteDataSourceImpl implements FilialRemoteDataSource {
  List<FilialModel> _allFilials = [];

  @override
  Future<List<FilialModel>> getAllFilials() async {
    final response =
    await http.get(Uri.parse('https://registratura.volganet.ru/filial'));
    if (response.statusCode == 200) {
      final List<dynamic> filialJson = json.decode(response.body)['data'];
      for (final json in filialJson) {
        try {
          _allFilials.add(FilialModel.fromJson(json));
        } catch (_) {
          print('Error fetching filial ${json}');
        }
      }
      return _allFilials;
    } else {
      throw ServerException();
    }

  }

  @override
  List<FilialModel> searchFilial(String query) {
    return [];
  }

}