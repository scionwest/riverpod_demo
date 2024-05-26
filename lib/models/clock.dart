import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Clock extends StateNotifier<DateTime> {
  late final Timer _timer;

  // Set initial value by calling super(DateTime.now())
  Clock() : super(DateTime.now()) {
    // Change the value of our state every 1 second to the new date.
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state = DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
