// Excepción base personalizada
class AppException implements Exception {
  final String message;
  final StackTrace stackTrace;

  const AppException(this.message, [this.stackTrace = StackTrace.empty]);

  @override
  String toString() => 'AppException: $message';
}

// Excepciones específicas
class ServerException extends AppException {
  const ServerException([String message = 'Server error', StackTrace? stackTrace])
      : super(message, stackTrace ?? StackTrace.empty);
}

class NetworkException extends AppException {
  const NetworkException([String message = 'Network error', StackTrace? stackTrace])
      : super(message, stackTrace ?? StackTrace.empty);
}

class NotFoundException extends AppException {
  const NotFoundException([String message = 'Not found', StackTrace? stackTrace])
      : super(message, stackTrace ?? StackTrace.empty);
}

class CacheException extends AppException {
  const CacheException([String message = 'Cache error', StackTrace? stackTrace])
      : super(message, stackTrace ?? StackTrace.empty);
}

class ValidationException extends AppException {
  const ValidationException([String message = 'Validation error', StackTrace? stackTrace])
      : super(message, stackTrace ?? StackTrace.empty);
}

class PermissionException extends AppException {
  const PermissionException([String message = 'Permission denied', StackTrace? stackTrace])
      : super(message, stackTrace ?? StackTrace.empty);
}