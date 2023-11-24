import 'package:dio/dio.dart';

void main() {
  parseResponseWithHighOrderArgs(simple);
}

Future<void> parseResponseWithHighOrderArgs<T>(Future<T> Function() request) async {
  //todo return rightValue
  final result = request().then((it) {
    //todo print log
  }).catchError((obj) {
    // non-200 error goes here.
    switch (obj.runtimeType) {
      case DioException:
        final res = (obj as DioException).response;
        final statusCode = res?.statusCode;
        final statusMessage = res?.statusMessage;
//todo Got error, print that error.
        break;
      default:
        break;
    }
  });
}

Future<String> simple() async {
  return '';
}
