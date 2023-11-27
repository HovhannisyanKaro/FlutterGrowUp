import 'network_resource.dart';

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

  Exception? isError(RequestType? response) {
    return null;
  }

  ResultType? processResponse(ResultType? data, RequestType? response) {
    return null;
  }

  void processErrorResponse(Exception? exception) {}

  Stream<NetworkResource<ResultType>> call() async* {
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