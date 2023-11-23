import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:retrofit/http.dart';

import 'demo/casino_games_response.dart';

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
    // TODO: implement getGames
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

class Resource<T> extends Equatable {
  final Status status;
  final Exception? error;
  final T? data;

  const Resource({required this.status, this.data, this.error});

  @override
  List<Object?> get props => [status, error, data];
}

enum Status { success, error, loading }

extension ResourceExtension<T> on Resource<T> {
  Resource<T> success(T data) {
    return Resource(status: Status.success, data: data);
  }

  Resource<T> error(Exception error, T data) {
    return Resource(status: Status.error, data: data, error: error);
  }

  Resource<T> loading() {
    return const Resource(status: Status.loading);
  }
}

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