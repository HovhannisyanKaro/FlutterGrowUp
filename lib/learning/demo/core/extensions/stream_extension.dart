import 'dart:async';

extension StreamExtension<T> on Stream<T> {
  Future<T> asFuture() {
    final completer = Completer<T>();
    late StreamSubscription<T> subscription;

    subscription = listen(
          (data) {
        completer.complete(data);
      },
      onError: (error) {
        completer.completeError(error);
        subscription.cancel();
      },
      onDone: () {
        if (!completer.isCompleted) {
          completer.completeError(
              Stream.error('Stream completed without emitting any value.'));
        }
      },
      cancelOnError: true,
    );
    return completer.future;
  }
}