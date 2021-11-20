import 'package:dartz/dartz.dart';
import 'package:get_tickets/core/error/failure.dart';
import 'package:get_tickets/feature/domain/entities/filial_entity.dart';
import 'package:get_tickets/feature/domain/repositories/filial_repository.dart';

class SearchFilials {
  final FilialRepository filialRepository;

  SearchFilials(this.filialRepository);

  Either<Failure, List<FilialEntity>> call(String query) {
    return filialRepository.searchFilail(query);
  }
}
