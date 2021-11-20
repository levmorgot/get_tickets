import 'package:get_tickets/core/error/failure.dart';
import 'package:get_tickets/feature/domain/entities/filial_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FilialRepository {
  List<FilialEntity>? filialEntityList;

  Future<Either<Failure, List<FilialEntity>>> getAllFilials();

  Either<Failure, List<FilialEntity>> searchFilail(String query);
}
