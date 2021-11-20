import 'package:dartz/dartz.dart';
import 'package:get_tickets/core/error/failure.dart';
import 'package:get_tickets/feature/domain/entities/filial_entity.dart';
import 'package:get_tickets/feature/domain/repositories/filial_repository.dart';

class GetAllFilials {
  final FilialRepository filialRepository;

  GetAllFilials(this.filialRepository);

  Future<Either<Failure, List<FilialEntity>>> call() async {
    return await filialRepository.getAllFilials();
  }
}
