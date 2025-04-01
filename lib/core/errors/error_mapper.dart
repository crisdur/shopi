import 'exceptions.dart';
import 'failures.dart';

/// Convierte excepciones en failures
Failure mapExceptionToFailure(Exception exception) {
  if (exception is ServerException) {
    return ServerFailure(message: exception.message);
  } else if (exception is NetworkException) {
    return NetworkFailure(message: exception.message);
  } else if (exception is NotFoundException) {
    return NotFoundFailure(exception.message);
  } else if (exception is CacheException) {
    return CacheFailure(exception.message);
  } else if (exception is ValidationException) {
    return ValidationFailure(exception.message);
  } else if (exception is PermissionException) {
    return PermissionFailure(exception.message);
  } else {
    return ServerFailure(message: 'Unexpected error: ${exception.toString()}');
  }
}