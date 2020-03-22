class FailedRetrievePostsException implements Exception {
  int errorCode;
  String message;

  FailedRetrievePostsException(this.errorCode, this.message);
}