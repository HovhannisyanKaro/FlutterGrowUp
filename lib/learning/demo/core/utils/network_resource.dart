import 'package:equatable/equatable.dart';

enum Status { success, error, loading }

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