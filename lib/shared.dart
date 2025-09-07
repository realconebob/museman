class InvalidArgumentException implements Exception {
  final String msg;
  const InvalidArgumentException([this.msg = '']);
  @override String toString() {return "<InvalidArgumentException> $msg";}
}