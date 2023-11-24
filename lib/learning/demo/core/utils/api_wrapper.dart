import 'package:equatable/equatable.dart';

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