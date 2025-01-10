import 'package:dartz/dartz.dart';

import '../errors/failures/base_failure.dart';

/// BaseUseCase
///
/// Clase abstracta que debe ser tipada el primer parámetro indica el tipo de retorno
/// y el segundo el que usa el caso de uso para su ejecución
abstract class BaseUseCase<Type, Params> {
  Future<Either<BaseFailure, Type>> call(Params params);
}

/// NoParams
///
/// Clase que se usa para cuando el caso de uso no recibe parámeteros
class NoParams {}
