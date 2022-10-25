class ServerException implements Exception {
  final int errorCode;
  final dynamic error;

  const ServerException({
    required this.errorCode,
    required this.error,
  });
}
