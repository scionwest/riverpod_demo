import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routing_shell_ex/models/cat_fact.dart';
import 'package:routing_shell_ex/providers/cat_fact_provider.dart';
import 'package:routing_shell_ex/providers/clock_provider.dart';
import 'package:routing_shell_ex/providers/counter_state_provider.dart';
import 'package:routing_shell_ex/providers/dateformat_provider.dart';
import 'package:routing_shell_ex/providers/helloworld_provider.dart';
import 'package:routing_shell_ex/providers/weather_provider.dart';

class HelloWorldConsumerStatefulWidget extends ConsumerStatefulWidget {
  const HelloWorldConsumerStatefulWidget({super.key});

  @override
  ConsumerState<HelloWorldConsumerStatefulWidget> createState() => _HelloWorldConsumerStatefulWidgetState();
}

class _HelloWorldConsumerStatefulWidgetState extends ConsumerState<HelloWorldConsumerStatefulWidget> {
  @override
  void initState() {
    super.initState();

    final helloWorld = ref.read(helloWorldProvider);
    print(helloWorld);
  }

  @override
  Widget build(BuildContext context) {
    final helloWorld = ref.watch(helloWorldProvider);
    final currentDate = ref.watch(clockProvider);
    final dateFormat = ref.watch(dateFormatterProvider);
    final weatherAsync = ref.watch(weatherFutureProvider('London'));
    // Only update if the fact is changed; not the length of the fact.
    final catFacts = ref.watch(catFactsProvider.selectAsync((value) => value.fact));

    ref.listen(counterStateProvider, (prev, next) {
      if (next is AsyncError) {
        print('failed');
      }
      final snackBar = SnackBar(
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
        behavior: SnackBarBehavior.floating,
        content: Text('Counter: $next'),
        duration: const Duration(seconds: 3),
        width: MediaQuery.of(context).size.width / 2,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      print('Counter was $prev and is now $next');
    });

    return Column(
      children: [
        Text(helloWorld),
        Text(dateFormat.format(currentDate)),
        TextButton(
          child: const Text('Increase Counter'),
          onPressed: () {
            ref.read(counterStateProvider.notifier).state++;
          },
        ),
        weatherAsync.when(
          data: (weather) => Text('Weather: ${weather.location} ${weather.temperature}°C'),
          error: (error, stack) => Text('Error: $error'),
          loading: () => const CircularProgressIndicator(),
        ),
        TextButton(
          onPressed: () {
            // Refresh the API call to get a new fact.
            ref.refresh(catFactsProvider);
          },
          child: Text('Get Cat Fact'),
        ),
        catFacts.when(
          // Show the facts as they're refreshed.
          data: (catFact) => Text(catFact.fact),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ],
    );
  }
}
