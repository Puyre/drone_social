import 'package:chopper/chopper.dart';
import 'package:drone_assist/feature/core/exceptions/server_exception.dart';

extension ResponseExtension<T> on Response<T> {
  T proceedResponse() {
    if (isSuccessful) {
      return body as T;
    } else {
      throw ServerException(
        errorCode: statusCode,
        error: error,
      );
    }
  }
}
