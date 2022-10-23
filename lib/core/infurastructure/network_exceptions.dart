class KoException implements Exception {
  final String? message;

  final int statusCode;
  const KoException({required this.statusCode, this.message});

  @override
  String toString() {
    return 'KoException: statusCode: $statusCode, message: ${message ?? 'No message specified'}';
  }
}
