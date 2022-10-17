import 'package:chopper/chopper.dart';
import 'package:drone_assist/feature/core/exceptions/server_exception.dart';

extension ResponseExtension<T> on Response<T> {
  Map<String, dynamic> proceedResponse() {
    if (isSuccessful) {
      return body as Map<String, dynamic>;
    } else {
      throw ServerException(
        errorCode: statusCode,
        error: error,
      );
    }
  }
}
