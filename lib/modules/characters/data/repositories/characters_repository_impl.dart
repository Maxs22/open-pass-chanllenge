import 'package:dartz/dartz.dart';
import 'package:open_pass_challenge/core/errors/failures/base_failure.dart';
import 'package:open_pass_challenge/core/services/debug_service.dart';
import 'package:open_pass_challenge/modules/characters/data/provider/characters_provider.dart';
import 'package:open_pass_challenge/modules/characters/domain/entity/characters.dart';
import 'package:open_pass_challenge/modules/characters/domain/repositories/characters_repository.dart';

class CharactersRepositoryImpl extends ICharactersRepository {
  CharactersRepositoryImpl({required this.provider});

  final ICharactersProvider provider;

  @override
  Future<Either<BaseFailure, List<Characters>>> getCharacters() async {
    try {
      DebugService.debugLog('[$runtimeType] - Obteniendo personajes...');
      final List<Characters> characters = await provider.getCharacters();
      return Right(characters);
    } catch (error) {
      DebugService.debugLog(
          '[$runtimeType] - Error al intentar obtener los Personajes...');
      return Left(ServerFailure(errorMessage: error.toString()));
    }
  }
}
