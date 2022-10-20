import 'package:chopper/chopper.dart';
import 'package:drone_assist/feature/core/exceptions/server_exception.dart';

extension ResponseExtension<T> on Response<T> {
  Response<T> proceedResponse() {
    if (isSuccessful) {
      return this;
    } else {
      throw ServerException(
        errorCode: statusCode,
        error: error,
      );
    }
  }
}
