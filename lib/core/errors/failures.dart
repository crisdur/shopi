// Clase abstracta base para todos los tipos de fallos
abstract class Failure {
  final String message;
  final String? code;

  const Failure({
    required this.message,
    this.code,
  });

  @override
  String toString() => 'Failure: $message';
}

// Fallos relacionados con el servidor
class ServerFailure extends Failure {
  const ServerFailure({
    required String message,
    String? code,
  }) : super(message: message, code: code);
}

// Fallos de conexión de red
class NetworkFailure extends Failure {
  const NetworkFailure({
    required String message,
    String? code,
  }) : super(message: message, code: code);
}

// Fallos de datos no encontrados
class NotFoundFailure extends Failure {
  const NotFoundFailure([String message = 'Not found', String? code])
      : super(message: message, code: code);
}

// Fallos de caché
class CacheFailure extends Failure {
  const CacheFailure([String message = 'Cache error', String? code])
      : super(message: message, code: code);
}

// Fallos de validación
class ValidationFailure extends Failure {
  const ValidationFailure([String message = 'Validation error', String? code])
      : super(message: message, code: code);
}

// Fallos de permisos
class PermissionFailure extends Failure {
  const PermissionFailure([String message = 'Permission denied', String? code])
      : super(message: message, code: code);
}