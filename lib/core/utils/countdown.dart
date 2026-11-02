import 'dart:async';

/// Ticks once a second down to 0. Call [cancel] in close().
class Countdown {
  Timer? _timer;

  void start(int seconds, void Function(int left) onTick) {
    _timer?.cancel();
    onTick(seconds);
    if (seconds <= 0) return;
    var left = seconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      left--;
      if (left <= 0) timer.cancel();
      onTick(left < 0 ? 0 : left);
    });
  }

  void cancel() => _timer?.cancel();
}
