import 'dart:io';

class ErrorException extends IOException {
  String message;
  int? code;

  ErrorException({required this.message, this.code});
}