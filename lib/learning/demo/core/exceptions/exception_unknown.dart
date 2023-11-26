import 'dart:io';

class UnknownException extends IOException {
  String? msg;

  UnknownException({this.msg}) : super();
}