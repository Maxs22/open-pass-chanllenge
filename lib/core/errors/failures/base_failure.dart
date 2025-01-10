import 'package:equatable/equatable.dart';

/// BaseFailure
///
/// Clase que nos permite definir tipos de fallas a nivel capa de dominio.
abstract class BaseFailure extends Equatable {}

class ServerFailure extends BaseFailure {
  final String errorMessage;

  ServerFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
