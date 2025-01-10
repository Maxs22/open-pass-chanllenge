import 'package:dartz/dartz.dart';
import 'package:open_pass_challenge/core/errors/failures/base_failure.dart';
import 'package:open_pass_challenge/modules/characters/domain/entity/characters.dart';

abstract class ICharactersRepository {
  Future<Either<BaseFailure, List<Characters>>> getCharacters();
}
