import 'dart:async';

class BlogDebounce {
  Duration delay;
  Timer? _timer;

  BlogDebounce(
    this.delay,
  );

  call(void Function() callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  dispose() {
    _timer?.cancel();
  }
}