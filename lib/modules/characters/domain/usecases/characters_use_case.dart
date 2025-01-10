import 'package:dartz/dartz.dart';
import 'package:open_pass_challenge/core/errors/failures/base_failure.dart';
import 'package:open_pass_challenge/core/use_cases/base_use_case.dart';
import 'package:open_pass_challenge/modules/characters/domain/entity/characters.dart';

import '../repositories/characters_repository.dart';

class CharactersUseCase extends BaseUseCase<List<Characters>, NoParams> {
  CharactersUseCase({required this.repository});

  final ICharactersRepository repository;

  @override
  Future<Either<BaseFailure, List<Characters>>> call(NoParams params) async {
    return await repository.getCharacters();
  }
}
