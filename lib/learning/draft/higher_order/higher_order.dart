import 'package:dio/dio.dart';

void main() {
  parseResponseWithHighOrderArgs(simple);
}

Future<void> parseResponseWithHighOrderArgs<T>(Future<T> Function() request) async{
  final result = await request().then((it){
    //todo print log
  }).catchError((obj){
    // non-200 error goes here.
    switch(obj.runtimeType){
      case DioException:
        final res = (obj as DioException).response;
        final statusCode = res?.statusCode;
        final statusMessage = res?.statusMessage;

        break;
      default:
        break;
    }
  });
}

Future<String> simple() async {
  return '';
}

// client.getTask('2').then((it) {
// logger.i(it);
// }).catchError((obj) {
// // non-200 error goes here.
// switch (obj.runtimeType) {
// case DioError:
// // Here's the sample to get the failed response error code and message
// final res = (obj as DioError).response;
// logger.e('Got error : ${res.statusCode} -> ${res.statusMessage}');
// break;
// default:
// break;
// }
// });
