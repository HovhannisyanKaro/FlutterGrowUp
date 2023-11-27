import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:retrofit/retrofit.dart';

sealed class ApiWrapper<T> extends Equatable {
  @override
  List<Object?> get props => [];
}

class Success<T> extends ApiWrapper<T> {
  final T? value;

  Success({required this.value});

  @override
  List<Object?> get props => [value];
}

class Error extends ApiWrapper<Never> {
  final int? code;
  final String? error;

  Error({this.code, this.error});

  @override
  List<Object?> get props => [code, error];
}

class NetworkError extends ApiWrapper<Never> {
  NetworkError._();

  static final NetworkError _instance = NetworkError._();

  factory NetworkError() => _instance;
}

class UnknownError extends ApiWrapper<Never> {
  UnknownError._();

  static final UnknownError _instance = UnknownError._();

  factory UnknownError() => _instance;
}

/// if (connectivityResult == ConnectivityResult.mobile) {
///  I am connected to a mobile network.
/// } else if (connectivityResult == ConnectivityResult.wifi) {
///  I am connected to a wifi network.
/// } else if (connectivityResult == ConnectivityResult.ethernet) {
///  I am connected to a ethernet network.
/// } else if (connectivityResult == ConnectivityResult.vpn) {
///  I am connected to a vpn network.
///  Note for iOS and macOS:
///  There is no separate network interface type for [vpn].
///  It returns [other] on any device (also simulator)
/// } else if (connectivityResult == ConnectivityResult.bluetooth) {
///  I am connected to a bluetooth.
/// } else if (connectivityResult == ConnectivityResult.other) {
///  I am connected to a network which is not in the above mentioned networks.
/// } else if (connectivityResult == ConnectivityResult.none) {
///  I am not connected to any network.
///
/// }
Future<ApiWrapper<T>> parseResponse<T>(HttpResponse<T?> response) async {
  //todo ստեղ պետք ա մեթոդ փոխանցոեմ պարամետրով, call ը հենց ստեղ կազմակերպեմ ու retrofit ի request ից հետո կանչեմ
  //todo then https://pub.dev/packages/retrofit errorHandling ի համար։
  try {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      return NetworkError();
    }

    final httpResponse = response.response;

    final statusCode = httpResponse.statusCode;
    final body = httpResponse.data;
    final extra = httpResponse.extra;
    // httpResponse.
    //TODO (success -> >=200 <=299)
    final bool isSuccessful = statusCode == 200;
    if (isSuccessful) {
      return Success(value: body);
    } else {
      //todo how to get error message from Response ?
      return Error(code: statusCode, error: '');
    }
  } on DioException catch (e) {
    final ApiWrapper<T> error;
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      error = NetworkError();
    } else {
      error = UnknownError();
    }

    return error;
  } catch (e) {
    return UnknownError();
  }
}