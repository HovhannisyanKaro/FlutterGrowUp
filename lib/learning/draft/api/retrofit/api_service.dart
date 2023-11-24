import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://cmsbetconstruct.com')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(
      '/casino/getGames?partner_id=1&lang=eng&is_mobile=1&use_webp=1&country=AM&limit=4')
  Future<String?> getGames();
}

class ApiClient {
  ApiClient._();

  static final ApiClient _instance = ApiClient._();

  static ApiClient get instance => _instance;

  final Dio _dio = Dio();
  late final ApiService service = ApiService(_dio);
}

abstract interface class Repository {
  Future<String> getGames();
}

class RepositoryImpl extends Repository {
  final _api = ApiClient.instance.service;

  @override
  Future<String> getGames() {
    throw UnimplementedError();
  }
}

class RepositoryImpl2 extends Repository {
  final ApiService api;

  RepositoryImpl2({required this.api});

  @override
  Future<String> getGames() {
    throw UnimplementedError();
  }
}

class NetworkResource<T> extends Equatable {
  final Status status;
  final Exception? error;
  final T? data;

  const NetworkResource({required this.status, this.data, this.error});

  @override
  List<Object?> get props => [status, error, data];

  factory NetworkResource.success(T? data) =>
      NetworkResource(status: Status.success, data: data);

  factory NetworkResource.error(Exception error, T? data) =>
      NetworkResource(status: Status.error, data: data, error: error);

  factory NetworkResource.loading() =>
      const NetworkResource(status: Status.loading);
}

enum Status { success, error, loading }

sealed class ApiWrapper<T> extends Equatable {
  @override
  List<Object?> get props => [];
}

class Success<T> extends ApiWrapper<T> {
  final T value;

  Success({required this.value});

  @override
  List<Object?> get props => [value];
}

class Error extends ApiWrapper<void> {
  final int? code;
  final String? error;

  Error({this.code, this.error});

  @override
  List<Object?> get props => [code, error];
}

class NetworkError extends ApiWrapper<void> {
  NetworkError._();

  static final NetworkError _instance = NetworkError._();

  factory NetworkError() => _instance;
}

class UnknownError extends ApiWrapper<void> {
  UnknownError._();

  static final UnknownError _instance = UnknownError._();

  factory UnknownError() => _instance;
}

ApiWrapper<T>? parseResponse<T>() {
  return null;
}

@JsonSerializable()
class ResponseBody {
  @JsonKey(name: _JsonKey.status)
  final String status;
  @JsonKey(name: _JsonKey.response)
  final Map<String, dynamic> response;

  ResponseBody({required this.status, required this.response});
}

abstract class _JsonKey {
  static const String status = 'status';
  static const String response = 'response';
}

abstract class NetworkBoundResource<ResultType, RequestType> {
  Future<ResultType?> fetchFromStorage() async {
    return null;
  }

  bool shouldFetch(ResultType? result) {
    return true;
  }

  Future<RequestType?> fetchFromNetwork() async {
    return null;
  }

  Future<void> saveNetworkResult(ResultType? result) async {}

  Exception? isError(RequestType? request) {
    return null;
  }

  ResultType? processResponse(ResultType? result, RequestType? request) {
    return null;
  }

  void processErrorResponse(Exception? exception) {}

  Stream<NetworkResource<ResultType>> run() async* {
    yield (NetworkResource<ResultType>.loading());

    final storageValue = await fetchFromStorage();
    final fetch = shouldFetch(storageValue);

    final NetworkResource<ResultType> result;

    if (fetch) {
      final apiResponse = await fetchFromNetwork();
      final error = isError(apiResponse);
      if (error == null) {
        final processedResponse = processResponse(storageValue, apiResponse);
        await saveNetworkResult(processedResponse);
        result = NetworkResource.success(storageValue);
      } else {
        processErrorResponse(error);
        result = NetworkResource.error(error, null);
      }
    } else {
      result = NetworkResource.success(storageValue);
    }
    yield (result);
  }
}