import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routing_shell_ex/models/clock.dart';

// Consider legacy and shouldn't be used.
// AsyncNotifier replaces this.
final clockProvider = StateNotifierProvider<Clock, DateTime>((ref) {
  return Clock();
});
