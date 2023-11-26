import 'dart:io';

class UnknownException extends IOException {
  String? msg;

  UnknownException({this.msg}) : super();
}

class NetworkException extends IOException {
  String? msg;

  NetworkException({this.msg}) : super();
}

class ErrorException extends IOException {
  String message;
  int? code;

  ErrorException({required this.message, this.code});
}