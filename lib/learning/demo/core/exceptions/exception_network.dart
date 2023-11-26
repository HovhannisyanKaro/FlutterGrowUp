import 'dart:io';

class NetworkException extends IOException {
  String? msg;

  NetworkException({this.msg}) : super();
}